namespace :db do

  desc "Seed emotion data"
  task :seed => :environment do
    %w(
      positive
      negative
      neutral
      ).each do |name|
      Emotion.create(:name => name.downcase)
    end
  end

end
