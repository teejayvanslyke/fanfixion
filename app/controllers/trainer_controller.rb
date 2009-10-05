class TrainerController < ApplicationController

  def index
    @status   = Status.random
    @emotion  = Emotion.random
  end

end
