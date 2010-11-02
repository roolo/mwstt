class CreateActivityDatetimeConnection < ActiveRecord::Migration
  def self.up
    change_table  :datetimes do |t|
      t.references  :activities
    end
  end

  def self.down
    drop_column :datetimes, :activiy_id
  end
end
