class AjaxController < ApplicationController
  layout nil

  # @todo Limit result for current user
  def activities_contains
    @activities = Activity.all :conditions => ['name LIKE ?', '%'+params[:new_tracking_info][:activity_name]+'%' ]
  end

end
