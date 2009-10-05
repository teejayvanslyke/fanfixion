class Sentiment < ActiveRecord::Base

  named_scope :matched, :conditions => { :match => true }

  belongs_to :status
  belongs_to :emotion

  after_create :train_classifier

  def train_classifier
    if self.trained
      self.emotion.train(self.status, self.match)
    end
  end
end
