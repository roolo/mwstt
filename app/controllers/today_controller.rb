# Handles starting and stoping of work, lists todays past work
class TodayController < ApplicationController
    DATETIME_START_ACTION_CODE = 'start'
    DATETIME_STOP_ACTION_CODE  = 'stop'

  before_filter :require_user

  # Handles starting and stoping of work, lists todays past work
  def index
    @datetimes = current_user.datetimes.where ["DATE(start) = DATE(?)", Time.now]

    if params[:new_tracking_info]
      @desired_activity_name = params[:new_tracking_info][:activity_name]
    end

    self.prepare_tracking_data

    @tags = current_user.datetimes.tag_counts_on(:tags)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @datetimes }
    end
  end

  # Prepare data for start/stop form
  def prepare_tracking_data
    @start_stop_action = self.get_start_stop_action

    @opened_datetime = Datetime.get_opened_one current_user
    if @opened_datetime.nil?
      @activity_name = ''
    else
      @activity = @opened_datetime.activity
      @activity_name = @activity.name
      @activity_spent = self.get_activity_spent_time
    end
  end

  # Returns amount of hours and minutes spent on current acitivty
  #
  # @return [String] Amount of hours and minutes spent on current acitivty
  #
  # @todo Change the way for building spent time to more clean one
  def get_activity_spent_time
    datetime_start = Datetime.get_opened_one(current_user).start
    activity_spent_seconds = Time.now - datetime_start
    [ activity_spent_seconds.to_i / 3600, activity_spent_seconds.to_i / 60 % 60 ].map{ |t| t.to_s.rjust(2, '0') }.join(':')
  end

  # Returns code of action which should be performed by clicking on start/stop button
  #
  # @return [String]
  def get_start_stop_action
    if current_user.datetimes.count(:conditions => "stop IS NULL") > 0
      return DATETIME_STOP_ACTION_CODE
    else
      return DATETIME_START_ACTION_CODE
    end
  end

  # Starts tracking time on activity with name given as request parameter
  def start
    redirect_params = {:action => "index"}

    begin
      newDatetime = Datetime.get_new_datetime params[:new_tracking_info], current_user
    rescue Exceptions::ActivityAlreadyBelongsToProject => exception
      flash[:notice] = 'Project assignment was deleted. Activity already has assigned another project.'
      redirect_params.merge!({
        :activity_name => params[:new_tracking_info][:activity_name],
        :datetime_params => params[:new_tracking_info][:datetime_params].gsub(/@(\w*)/, '').strip
      })
    end

    redirect_to(redirect_params)

  end

  # Stops tracking time on opened datetime
  def stop
    stopable_datetimes = Datetime.all   :conditions => [  " user_id = ?
                                                            AND stop IS NULL
                                                          ",
                                                          current_user,
                                        ],
                                        :limit => 1

    stopable_datetimes.each do |datetime|
      datetime.stop = DateTime.now
      datetime.save
    end

    redirect_to(:action => "index")
  end
end
