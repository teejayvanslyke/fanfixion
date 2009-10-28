class CreatePivots < ActiveRecord::Migration
  def self.up
    create_table :pivots do |t|
      t.integer :emotion_id
      t.integer :trend_id

      t.timestamps
    end

    add_index :pivots, :emotion_id
    add_index :pivots, :trend_id
  end

  def self.down
    remove_index :pivots, :trend_id
    remove_index :pivots, :emotion_id
    drop_table :pivots
  end
end
