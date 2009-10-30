class Pivot < ActiveRecord::Base

  belongs_to :trend
  belongs_to :emotion
  has_many   :statuses

  def self.find_or_create_by_emotion_and_trend(emotion, trend)
    find_by_emotion_id_and_trend_id(emotion.id, trend.id) || create(:emotion => emotion, :trend => trend)
  end

  def score_today
    0.0 + (statuses.today.count / trend.statuses.today.count) * 100
  end

  def score_for_hour
    0.0 + (statuses.in_last_hour.count / trend.statuses.in_last_hour.count) * 100
  end

  def score_for_all_time
    return 0.0 if trend.statuses.count == 0
    0.0 + (statuses.count / trend.statuses.count) * 100
  end

  def formatted_score
    "#{score_for_all_time.round}%"
  end

end
