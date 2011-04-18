class DatetimeHasDescription < ActiveRecord::Migration
  def self.up
    add_column :datetimes, :description, :text
  end

  def self.down
    remove_column :datetimes, :description
  end
end
