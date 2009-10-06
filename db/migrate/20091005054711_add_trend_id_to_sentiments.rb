class AddTrendIdToSentiments < ActiveRecord::Migration
  def self.up
    add_column :sentiments, :trend_id, :integer
    add_index :sentiments, :trend_id
  end

  def self.down
    remove_index :sentiments, :trend_id
    remove_column :sentiments, :trend_id
  end
end
