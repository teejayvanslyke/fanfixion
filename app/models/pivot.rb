class Pivot

  def initialize(params={})
    @emotion = params[:emotion]
    @trend   = params[:trend]
  end

  def sentiments
    @sentiments = Sentiment.for_pivot(@emotion, @trend)
  end

  def score
    return if sentiments.count == 0
    (1.0 * sentiments.matched.count / sentiments.count) * 100
  end

  def formatted_score
    "#{score.round}%"
  end

end
