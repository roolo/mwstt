class AjaxController < ApplicationController
  layout nil

  # @todo Limit result for current user
  def activities_contains
    @activities = Activity.all(
      :conditions => [
        'name LIKE ? AND datetimes.user_id = ?',
        '%'+params[:new_tracking_info][:activity_name]+'%',
        current_user.id
      ],
      :include => :datetimes
    )
  end

end
