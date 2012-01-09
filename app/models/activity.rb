class Activity < ActiveRecord::Base
  has_many  :datetimes
  belongs_to :project
  belongs_to :user
  accepts_nested_attributes_for :user
  

  def to_s
    name
  end


  def self.all_owned_by user
    self.all  :conditions => [
                "datetimes.user_id = ?",
                user
              ],
              :include => [:datetimes],
              :order => "activities.name ASC"
  end

end
