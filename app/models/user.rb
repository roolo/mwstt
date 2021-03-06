class User < ActiveRecord::Base
  acts_as_authentic
  acts_as_tagger
  attr_accessible :username, :email, :locale_id, :timezone, :password, :password_confirmation, :icon_set

  has_many  :datetimes, :order => 'datetimes.start ASC'
  belongs_to  :locale
  accepts_nested_attributes_for :locale
end
