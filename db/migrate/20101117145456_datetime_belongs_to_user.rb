class DatetimeBelongsToUser < ActiveRecord::Migration
  def self.up
    change_table :datetimes do |t|
      t.references  :user
    end
  end

  def self.down
    remove_column :datetimes, :user
  end
end
