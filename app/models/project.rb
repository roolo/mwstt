class Project < ActiveRecord::Base
  belongs_to :project
  has_many  :activities

  def to_s
    name
  end
end
