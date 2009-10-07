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
    return if sentiments(period).count == 0
    (1.0 * sentiments(period).matched.count / sentiments(period).count) * 100
  end

  def formatted_score
    "#{score.round}%"
  end

end
