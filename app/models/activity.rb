class Activity < ActiveRecord::Base
  has_many  :datetimes
  belongs_to :project
end
