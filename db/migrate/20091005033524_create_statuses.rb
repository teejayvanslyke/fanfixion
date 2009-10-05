class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.integer :twitter_id
      t.string :text
      t.boolean :favorited
      t.boolean :truncated
      t.string  :twitter_user_screen_name
      t.integer :trend_id

      t.timestamps
    end

    add_index :statuses, :trend_id
  end

  def self.down
    remove_index :statuses, :trend_id
    drop_table :statuses
  end
end
