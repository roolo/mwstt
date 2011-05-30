class Project < ActiveRecord::Base
  belongs_to :project
  has_many  :activities

  def to_s
    name
  end

  def self.all_owned_by user
    self.all  :conditions => [
                "datetimes.user_id = ?",
                user
              ],
              :include => {:activities => :datetimes},
              :order => "projects.name ASC"
  end
end
