class PivotsController < ApplicationController

  def new
    @trends = Trend.all
    @emotions = Emotion.all
  end

  def index
  end

  def show
    @emotion = Emotion.find_by_name(params[:emotion_name])
    @trend   = Trend.find_by_name(params[:trend_name])
    @pivot   = Pivot.find_or_create_by_emotion_and_trend(@emotion, @trend)
  end

end
