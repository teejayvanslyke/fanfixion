class SentimentsController < ApplicationController

  def create
    @emotion = Emotion.find(params[:emotion_id])
    @status  = Status.find(params[:status_id])

    pivot = Pivot.find_or_create_by_emotion_and_trend(@emotion, @status.trend)

    if @status.update_attributes!(:pivot => pivot, :trained => true)
      flash[:notice] = "Thanks!  Emo just became more perceptive."
    else
      flash[:error] = "I'm sorry, Emo had a problem.  Try another."
    end

    redirect_to trainer_path
  end

end
