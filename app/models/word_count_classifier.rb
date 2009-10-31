class WordCountClassifier

  class << self

    def keywords
      @keywords ||= YAML::load_file(RAILS_ROOT + '/emotions.yml')
    end

    def stemmer
      @stemmer ||= ::Lingua::Stemmer.new
    end

    def classify(text)
      scores = {}

      Emotion.all.each do |emotion|
        scores[emotion.name] ||= 0
        keywords[emotion.name.capitalize].each do |keyword|
          scores[emotion.name] += 1 if text.include?(stemmer.stem(keyword))
        end
      end

      last = scores.to_a.sort {|a,b| a[1] <=> b[1]}.last
      return nil if last[1] == 0
      return last[0]
    end

  end

end
