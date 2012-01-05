class PerUserLocale < ActiveRecord::Migration
  def self.up
    create_table :locales do |nt|
      nt.string :name
      nt.string :locale_code
    end

    change_table  :users do |ct|
      ct.references :locales
    end
  end

  def self.down
    drop_table :locales
    remove_column :users, :locales_id
  end
end
