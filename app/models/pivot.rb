class Pivot

  def initialize(params={})
    @emotion = params[:emotion]
    @trend   = params[:trend]
  end

  def sentiments(period=:all_time)
    case period
    when :all_time
      @sentiments ||= Sentiment.for_pivot(@emotion, @trend)
    when :daily
      @sentiments ||= Sentiment.for_pivot(@emotion, @trend).since(1.day.ago)
    when :hourly
      @sentiments ||= Sentiment.for_pivot(@emotion, @trend).since(1.hour.ago)
    end
  end

  def score(period=:all_time)
    return 0 if sentiments(period).count == 0
    (1.0 * sentiments(period).matched.count / sentiments(period).count) * 100
  end

  def daily_scores_since(time)
    ScoreAudit.find(:all, :conditions => [ 'emotion_id = ? AND trend_id = ? AND type = ? AND created_at > ?',
                    @emotion.id, @trend.id, 'daily', time ])
  end

  def formatted_score
    "#{score.round}%"
  end

end
