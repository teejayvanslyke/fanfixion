class AddPivotToScoreAudit < ActiveRecord::Migration
  def self.up
    remove_column :score_audits, :trend_id
    remove_column :score_audits, :emotion_id
    add_column :score_audits, :pivot_id, :integer
    add_index :score_audits, :pivot_id
  end

  def self.down
    remove_column :score_audits, :pivot_id
    add_column :score_audits, :emotion_id, :integer
    add_column :score_audits, :trend_id, :integer
  end
end
