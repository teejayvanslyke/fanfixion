class AddPivotIdToStatuses < ActiveRecord::Migration
  def self.up
    add_column :statuses, :pivot_id, :integer
    add_index :statuses, :pivot_id
  end

  def self.down
    remove_index :statuses, :pivot_id
    remove_column :statuses, :pivot_id
  end
end
