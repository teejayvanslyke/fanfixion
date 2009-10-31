class Trend < ActiveRecord::Base

  named_scope :hottest, lambda {|count|
    { :order => 'created_at DESC', :limit => count }
  }

  has_many :statuses
  has_many :pivots
  has_many :emotions, :through => :pivots, :uniq => true, :order => 'created_at DESC' do 
    def first(limit=1)
      find(:all, :limit => limit)
    end
  end

  named_scope :most_recent, lambda {|limit|
    { :order => "created_at DESC", :limit => limit }
  }

  class << self

    def analyze_trend(trend)
      Twitter::Search.new(trend.name).each do |twitter_status|

        logger.info "========== #{trend.name} =========="
        logger.info "  #{Status.clean_text(twitter_status.text)}"

        classification = WordCountClassifier.classify(Status.clean_text(twitter_status.text)) 
        next unless classification
        
        emotion = Emotion.find_by_name(classification)

        if emotion
          logger.info "  Classified as '#{emotion.name}'"
          pivot = Pivot.find_or_create_by_emotion_and_trend(emotion, trend)
          pivot.statuses.create(
            :trend      => trend,
            :twitter_id => twitter_status.id,
            :text       => twitter_status.text,
            :favorited  => twitter_status.favorited,
            :truncated  => twitter_status.truncated,
            :twitter_user_screen_name => twitter_status.from_user
          )
        else
          logger.info "  Could not classify"
        end
      end

    end

    def analyze(what, *args)
      self.send(what, *args).each do |trend|
        analyze_trend trend
        sleep 1
      end

      # Trigger caching
      Pivot.all.each(&:save)
    end


    def analyze_current
      Twitter::Trends.current.each do |twitter_trend|
        trend = find_or_create_by_name(twitter_trend.name)
        analyze_trend trend
      end
    end

  end

end
