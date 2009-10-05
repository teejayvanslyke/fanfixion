class AddMatchToSentiments < ActiveRecord::Migration
  def self.up
    add_column :sentiments, :match, :boolean, :default => false
  end

  def self.down
    remove_column :sentiments, :match
  end
end
