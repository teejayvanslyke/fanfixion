class AddTrainedFlagToStatuses < ActiveRecord::Migration
  def self.up
    add_column :statuses, :trained, :boolean, :default => false
  end

  def self.down
    remove_column :statuses, :trained
  end
end
