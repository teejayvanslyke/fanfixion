class SentimentsController < ApplicationController

  def create
    @emotion = Emotion.find(params[:emotion_id])
    @status  = Status.find(params[:status_id])

    Sentiment.create(:emotion => @emotion, :status => @status, :match => params[:match], :trained => true)
    redirect_to trainer_path
  end

end
