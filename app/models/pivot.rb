class Pivot < ActiveRecord::Base

  named_scope :hottest, :order => 'score_for_all_time DESC'

  belongs_to :trend
  belongs_to :emotion
  has_many   :statuses
  has_many   :hourly_scores, :class_name => 'ScoreAudit', :conditions => "type = 'hourly'"

  before_save :touch_emotion
  before_save :cache_score_for_all_time
  before_save :cache_score_for_hour

  def touch!; save!; end

  def self.find_or_create_by_emotion_and_trend(emotion, trend)
    find_by_emotion_id_and_trend_id(emotion.id, trend.id) || create(:emotion => emotion, :trend => trend)
  end

  def score_today
    0.0 + (statuses.today.count / trend.statuses.today.count) * 100
  end

  def hourly_score; score_for_hour; end

  def formatted_score
    "#{score_for_all_time.round}%"
  end

  def touch_emotion
    emotion.touch!
  end

  def cache_score_for_all_time
    if !trend || trend.statuses.count == 0
      self.score_for_all_time = 0
    else
      puts "actually saving #{statuses.count.to_f} #{trend.statuses.count}"
      self.score_for_all_time = (statuses.count.to_f / trend.statuses.count) * 100
      puts self.score_for_all_time
    end
  end

  def cache_score_for_hour
    if !trend || trend.statuses.in_last_hour.empty?
      self.score_for_hour = 0
    else
      self.score_for_hour = (statuses.in_last_hour.count.to_f / trend.statuses.in_last_hour.count) * 100
    end
  end


end
