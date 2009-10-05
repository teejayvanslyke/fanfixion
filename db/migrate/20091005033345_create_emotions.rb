class CreateEmotions < ActiveRecord::Migration
  def self.up
    create_table :emotions do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :emotions
  end
end
