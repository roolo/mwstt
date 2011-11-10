class RenameLocalesIdColumnToLocaleId < ActiveRecord::Migration
  def self.up
    rename_column :users, :locales_id, :locale_id
  end

  def self.down
    rename_column :users, :locale_id, :locales_id
  end
end
