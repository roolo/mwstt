class Datetime < ActiveRecord::Base
  belongs_to  :activity
  
  def self.getNewDatetime activity_name
    joined_activity = Activity.find_or_create_by_name activity_name
    
    new_datetime = self.new
    new_datetime.activities_id = joined_activity.id
    new_datetime.start = DateTime.now
    new_datetime.stop = nil
    new_datetime.save
    
    return new_datetime
  end
  
  def self.get_opened_one
    return Datetime.find_by_stop nil
  end
end
