class Datetime < ActiveRecord::Base
  acts_as_taggable
  
  belongs_to  :activity
  
  belongs_to  :user
  
  # Starts new datetime linked to activity given by name
  #
  # @param [String] activity_name Name of activity which should be datetime linked to
  # @param [User] creator Name of activity which should be datetime linked to
  #
  # @return [Datetime]
  def self.getNewDatetime new_tracking, creator
    datetime_tags = new_tracking[:datetime_params].scan /\#(\w*)/
    joined_activity = Activity.find_or_create_by_name new_tracking[:activity_name]
    
    
    new_datetime = self.new
    creator.tag(new_datetime, :with => datetime_tags, :on => 'tags')
    new_datetime.activities_id = joined_activity.id
    new_datetime.user = creator
    new_datetime.start = DateTime.now
    new_datetime.stop = nil
    new_datetime.save
    
    
    return new_datetime
  end
  
  # Returns datetime which is not finished
  #
  # @return [Datetime]
  def self.get_opened_one current_user
    return current_user.datetimes.find_by_stop nil
  end
end
