class TodayController < ApplicationController
    DATETIME_START_ACTION_CODE = 'start'
    DATETIME_STOP_ACTION_CODE  = 'stop'
  
  def index
    @datetimes = Datetime.where ["DATE(start) = DATE(?)", Time.now]
    self.prepare_tracking_data
  end
  
  def prepare_tracking_data
    @start_stop_action = self.get_start_stop_action
    
    opened_datetime = Datetime.get_opened_one
    if opened_datetime.nil?
      @activity_name = ''
    else
      @activity = Activity.find(opened_datetime.activities_id)
      @activity_name = @activity.name
      @activity_spent = self.get_activity_spent_time
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @datetimes }
    end
  end
  
  def get_activity_spent_time
    datetime_start = Datetime.get_opened_one.start
    activity_spent_seconds = Time.now - datetime_start
    return [ activity_spent_seconds.to_i / 3600, activity_spent_seconds.to_i / 60 % 60 ].map{ |t| t.to_s.rjust(2, '0') }.join(':')
  end
  
  def get_start_stop_action
    if Datetime.count(:conditions => "stop IS NULL") > 0
      return DATETIME_STOP_ACTION_CODE
    else
      return DATETIME_START_ACTION_CODE
    end
  end
  
  def start
    newDatetime = Datetime.getNewDatetime params[:activity_name]
    
    redirect_to(:action => "index")
    
  end
  
  def stop
    stopableDatetimes = Datetime.find_all_by_stop nil
    
    stopableDatetimes.each do |datetime|
      datetime.stop = DateTime.now
      datetime.save
    end
    
    redirect_to(:action => "index")
  end
end
