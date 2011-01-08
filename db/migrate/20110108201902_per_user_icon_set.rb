class PerUserIconSet < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string  :icon_set
    end
  end

  def self.down
    remove_column :users, :icon_set
  end
end
