class Activity < ActiveRecord::Base
  has_many  :datetimes
  belongs_to :project

  def to_s
    name
  end
end
