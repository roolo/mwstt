class ForeignKeyColumnNameFix < ActiveRecord::Migration
  def self.up
    change_table :datetimes do |t|
      t.references  :activity
    end
    
    Datetime.update_all ["activity_id = activities_id"]
  end

  def self.down
    remove_column :datetimes, :activity_id 
  end
end
