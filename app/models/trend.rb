class Trend < ActiveRecord::Base

  has_many :statuses
  has_many :sentiments
  has_many :emotions, :through => :sentiments, :uniq => true, :order => 'created_at DESC' do 
    def first(limit=1)
      find(:all, :limit => limit)
    end
  end

  named_scope :most_recent, lambda {|limit|
    { :order => "created_at DESC", :limit => limit }
  }

  class << self

    def analyze_current
      Twitter::Trends.current.each do |twitter_trend|
        trend = find_or_create_by_name(twitter_trend.name)
        Twitter::Search.new(trend.name).each do |twitter_status|
          status = trend.statuses.create(
            :twitter_id => twitter_status.id,
            :text       => twitter_status.text,
            :favorited  => twitter_status.favorited,
            :truncated  => twitter_status.truncated,
            :twitter_user_screen_name => twitter_status.from_user
          )
          Emotion.all.each do |emotion|
            emotion.classify(status)
          end
        end
      end
    end

  end

end
