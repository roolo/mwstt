class Project < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many  :activities
  accepts_nested_attributes_for :user

  def to_s
    name
  end

  def self.all_owned_by user
    self.all  :conditions => [
      "user_id = ?",
      user
    ],
              :include => {:activities => :datetimes},
              :order => "projects.name ASC"
  end
end
