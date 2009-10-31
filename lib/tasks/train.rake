desc "Train the classifier using the word list"
task :train => :environment do

  Emotion.destroy_all

  data = YAML::load_file(RAILS_ROOT + '/emotions.yml')

  data.each do |emotion_name, word_list|
    Emotion.create(:name => emotion_name.downcase.strip)
  end

  data.each do |emotion_name, words|
    words.each do |word|
      puts "Training #{word.downcase.strip}"
      StatusClassifier.train(emotion_name.downcase, word.downcase.strip)
    end
  end

end
