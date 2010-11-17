class User < ActiveRecord::Base
  acts_as_authentic
  acts_as_tagger
  attr_accessible :username, :email, :locales_id, :password, :password_confirmation
  
  has_many  :datetimes
  belongs_to  :locale
end
