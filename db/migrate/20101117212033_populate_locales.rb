class PopulateLocales < ActiveRecord::Migration
  def self.up
    english = Locale.new :name => 'English', :locale_code => 'en'
    english.save
    
    czech = Locale.new :name => 'Čeština', :locale_code => 'cs'
    czech.save
  end

  def self.down
    drop_table :locales
    
    create_table :locales do |nt|
      nt.string :name
      nt.string :locale_code
    end
  end
end
