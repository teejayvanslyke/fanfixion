require 'drb'

class StatusClassifier

  class << self
    def instance
      @instance ||= YAML::load_file(self.snapshots.last) || Classifier::Bayes.new(:categories => Emotion.all.map {|e| e.name})
    end

    def classify(text)
      instance.classify(text)
    end

    def snapshots
      Dir[File.join(RAILS_ROOT, 'snapshots', '*.yml')]
    end
    
    def take_snapshot
      File.open(File.join(RAILS_ROOT, 'snapshots', 'snapshot.yml'), 'w' ) do |out|
        YAML.dump(instance, out)
      end
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
