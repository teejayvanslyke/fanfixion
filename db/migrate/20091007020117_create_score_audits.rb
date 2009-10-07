class CreateScoreAudits < ActiveRecord::Migration
  def self.up
    create_table :score_audits do |t|
      t.integer :emotion_id
      t.integer :trend_id
      t.string :type
      t.float :score

      t.timestamps
    end
  end

  def self.down
    drop_table :score_audits
  end
end
