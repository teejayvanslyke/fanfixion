require 'drb'

class StatusClassifier

  class << self
    def instance
      self.madeleine.system
    end

    def madeleine
      SnapshotMadeleine.new(File.join(RAILS_ROOT, 'snapshots')) do
        Classifier::Bayes.new(:categories => Emotion.all.map {|e| e.name})
      end
    end

    def classify(text)
      instance.classify(text)
    end
    
    def take_snapshot
      madeleine.take_snapshot
    end

    def train(category, text)
      instance.train(category, text)
      take_snapshot
    end

    def start_service
      DRb.start_service('druby://localhost:12345', instance)
    end
  end
end
