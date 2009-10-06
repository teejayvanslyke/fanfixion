class Sentiment < ActiveRecord::Base

  named_scope :matched, :conditions => { :match => true }
  named_scope :for_pivot, lambda {|emotion, trend| 
    { :conditions => { :emotion_id => emotion.id, :trend_id => trend.id } }
  }

  belongs_to :status
  belongs_to :emotion
  belongs_to :trend

  after_create :train_classifier
  before_save  :cache_trend_id

  def train_classifier
    if self.trained
      self.emotion.train(self.status, self.match)
    end
  end

  def cache_trend_id
    self.trend_id = self.status.trend_id
  end
end
