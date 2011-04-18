class ActivityBelongsToProject < ActiveRecord::Migration
  def self.up
    change_table :activities do |table|
       table.references :project
    end
  end

  def self.down
    remove_column :activities, :project
  end
end
