class CreateDatetimes < ActiveRecord::Migration
  def self.up
    create_table :datetimes do |t|
      t.datetime :start
      t.datetime :stop

      t.timestamps
    end
  end

  def self.down
    drop_table :datetimes
  end
end
