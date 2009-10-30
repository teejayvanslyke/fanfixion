class Emotion < ActiveRecord::Base
  
  named_scope :hottest, { :order => 'pivot_count DESC' }

  has_many :pivots
  has_many :statuses, :through => :pivots, :order => 'created_at DESC'
  has_many :trends, :through => :pivots, :uniq => true, :order => 'created_at DESC' do 
    def first(limit=1)
      find(:all, :limit => limit)
    end
  end


  before_save :cache_pivot_count

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

  def score
    return 0.0 if Trend.count == 0
    (0.0 + (pivot_count / Trend.count) * 100).round
  end

  # Debug method.
  def classify_text(text)
    StatusClassifier.classify(text)
  end

  def opposite_name
    "Not #{self.name}"
  end

  def cache_pivot_count
    self.pivot_count = self.pivots.count
  end
end
