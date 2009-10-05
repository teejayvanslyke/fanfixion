class CreateSentiments < ActiveRecord::Migration
  def self.up
    create_table :sentiments do |t|
      t.integer :status_id
      t.integer :emotion_id
      t.boolean :trained

      t.timestamps
    end
  end

  def self.down
    drop_table :sentiments
  end
end
