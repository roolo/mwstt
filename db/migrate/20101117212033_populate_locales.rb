# encoding: utf-8

class PopulateLocales < ActiveRecord::Migration
  def self.up
    say_with_time("Creating english locale") do
      english = Locale.new :name => 'English', :locale_code => 'en'
      english.save
    end

    say_with_time("Creating english locale") do
      czech = Locale.new :name => 'Čeština', :locale_code => 'cs'
      czech.save
    end
  end

  def self.down
    drop_table :locales

    create_table :locales do |nt|
      nt.string :name
      nt.string :locale_code
    end
  end
end
