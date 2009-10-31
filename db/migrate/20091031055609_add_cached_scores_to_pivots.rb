class AddCachedScoresToPivots < ActiveRecord::Migration
  def self.up
    add_column :pivots, :score_for_all_time,  :decimal
    add_column :pivots, :score_for_hour,      :decimal
    add_column :pivots, :score_for_today,    :decimal
  end

  def self.down
    remove_column :pivots, :score_for_all_time
    remove_column :pivots, :score_for_hour
    remove_column :pivots, :score_for_today
  end
end
