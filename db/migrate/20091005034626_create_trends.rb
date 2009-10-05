class CreateTrends < ActiveRecord::Migration
  def self.up
    create_table :trends do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :trends
  end
end
