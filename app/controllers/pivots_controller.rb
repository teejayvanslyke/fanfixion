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
    @pivot   = Pivot.new(:emotion => @emotion, :trend => @trend)
  end

end
