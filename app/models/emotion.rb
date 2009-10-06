class Emotion < ActiveRecord::Base

  has_many :sentiments
  has_many :trends, :through => :sentiments, :uniq => true, :order => 'created_at DESC' do 
    def first(limit=1)
      find(:all, :limit => limit)
    end
  end

  def to_param
    self.name
  end

  def self.random
    find(:first, :order => 'rand()')
  end

  def train(status, match)
    if match
      StatusClassifier.train(self.name, status.text)
    end

  end

  def classify(status)
    Sentiment.create(:emotion => self, :status => status, :match => StatusClassifier.classify(status.text).downcase == self.name)
  end

  def score
    (1.0 * self.sentiments.matched.count / self.sentiments.count) * 100
  end

  # Debug method.
  def classify_text(text)
    StatusClassifier.classify(text)
  end

  def opposite_name
    "Not #{self.name}"
  end
end
