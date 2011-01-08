class AddCentralTimeTrackerAttribute < ActiveRecord::Migration
  def self.up
    change_table :datetimes do |t|
      t.boolean  :in_ctt
    end
  end

  def self.down
    remove_column :datetimes, :in_ctt
  end
end
