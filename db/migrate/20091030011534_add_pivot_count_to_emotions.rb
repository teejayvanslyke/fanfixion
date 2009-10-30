class AddPivotCountToEmotions < ActiveRecord::Migration
  def self.up
    add_column :emotions, :pivot_count, :integer
  end

  def self.down
    remove_column :emotions, :pivot_count
  end
end
