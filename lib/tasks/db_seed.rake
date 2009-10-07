namespace :db do

  desc "Seed emotion data"
  task :seed => :environment do
    %w(
      Acceptance
      Affection
      Aggression
      Ambivalence
      Apathy
      Anxiety
      Boredom
      Compassion
      Confusion
      Contempt
      Depression
      Doubt
      Ecstasy
      Empathy
      Envy
      Embarrassment
      Euphoria
      Forgiveness
      Frustration
      Gratitude
      Grief
      Guilt
      Hatred
      Hope
      Horror
      Hostility
      Homesickness
      Hunger
      Hysteria
      Interest
      Loneliness
      Love
      Paranoia
      Pity
      Pleasure
      Pride
      Rage
      Regret
      Remorse
      Shame
      Suffering
      Sympathy).each do |name|
      Emotion.create(:name => name.downcase)
    end
  end

end
