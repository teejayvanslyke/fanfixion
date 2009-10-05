class Emotion < ActiveRecord::Base

  has_many :sentiments

  def to_param
    self.name
  end

  def self.random
    find(:first, :order => 'rand()')
  end

  def train(status, match)
    if match
      self.classifier.train(self.name, status.text)
    else
      self.classifier.train(self.opposite_name, status.text)
    end

    self.madaleine.take_snapshot
  end

  def classify(status)
    Sentiment.create(:emotion => self, :status => status, :match => self.classifier.classify(status.text).downcase == self.name)
  end

  def score
    (1.0 * self.sentiments.matched.count / self.sentiments.count) * 100
  end

  # Debug method.
  def classify_text(text)
    self.classifier.classify(text)
  end

  def classifier
    madaleine.system
  end

  def madaleine
    @madeleine ||= 
      SnapshotMadeleine.new(File.join(RAILS_ROOT, 'snapshots', self.name)) do
        Classifier::Bayes.new(self.name, self.opposite_name)
      end
  end

  def opposite_name
    "Not #{self.name}"
  end
end
