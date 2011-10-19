class User < ActiveRecord::Base
  acts_as_authentic
  acts_as_tagger
  attr_accessible :username, :email, :locales_id, :timezone, :password, :password_confirmation, :icon_set
  
  has_many  :datetimes, :order => 'datetimes.start ASC'
  belongs_to  :locale
end
