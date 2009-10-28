namespace :db do

  desc "Seed emotion data"
  task :seed => :environment do
    %w(
      anger
      disgust
      fear
      happiness
      sadness
      surprise
      ).each do |name|
      Emotion.create(:name => name.downcase)
    end
  end

end
