class Datetime < ActiveRecord::Base
  acts_as_taggable

  belongs_to  :activity

  belongs_to  :user

  cattr_reader :per_page
  @@per_page = 15

  # Starts new datetime linked to activity given by name
  #
  # @param [String] activity_name Name of activity which should be datetime linked to
  # @param [User] creator Name of activity which should be datetime linked to
  #
  # @return [Datetime]
  def self.get_new_datetime new_tracking, creator
    datetime_tags = new_tracking[:datetime_params].scan /\#(\w*)/
    new_tracking[:datetime_params].match /@(\w*)/
    project_name = $1

    joined_activity = Activity.find_or_create_by_name new_tracking[:activity_name]
    desired_project = Project.find_or_create_by_name_and_user_id( project_name, creator )

    if joined_activity.project.nil?
      joined_activity.project = desired_project
      joined_activity.save
    else
      raise Exceptions::ActivityAlreadyBelongsToProject unless project_name.nil?
    end

    # Saving an ownership
    joined_activity.user = creator
    joined_activity.save

    new_datetime = self.new
    creator.tag(new_datetime, :with => datetime_tags, :on => 'tags')
    new_datetime.activity = joined_activity
    new_datetime.user = creator
    new_datetime.start = DateTime.now
    new_datetime.stop = nil
    new_datetime.save

    new_datetime
  end

  # Returns datetime which is not finished
  #
  # @param [User] current_user User to which should the opened datetime belongs to
  #
  # @return [Datetime]
  def self.get_opened_one current_user
    return current_user.datetimes.find_by_stop nil
  end
end
