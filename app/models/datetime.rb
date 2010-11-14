class Datetime < ActiveRecord::Base
  belongs_to  :activity
  acts_as_taggable
  
  # Starts new datetime linked to activity given by name
  #
  # @param [String] activity_name Name of activity which should be datetime linked to
  #
  # @return [Datetime]
  def self.getNewDatetime new_tracking
    datetime_tags = new_tracking[:datetime_params].scan /\#(\w*)/
    joined_activity = Activity.find_or_create_by_name new_tracking[:activity_name]
    
    
    new_datetime = self.new
    new_datetime.activities_id = joined_activity.id
#    new_datetime.tag_list = new_tracking_informations[:datetime_params]
    new_datetime.tag_list = datetime_tags
    new_datetime.start = DateTime.now
    new_datetime.stop = nil
    new_datetime.save
    
    return new_datetime
  end
  
  # Returns datetime which is not finished
  #
  # @return [Datetime]
  def self.get_opened_one
    return Datetime.find_by_stop nil
  end
end
