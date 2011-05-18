# Handles activities maintenace
class ActivitiesController < ApplicationController
  before_filter :require_user
  
  # Serves listing of existing activities
  def index
    @activities = Activity.all  :conditions => [
                                  "datetimes.user_id = ?",
                                  current_user
                                ],
                                :include => [:datetimes],
                                :order => "activities.name ASC"

#        current_user.datetimes.map{|datetime| datetime.activity}.unique

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activities }
    end
  end

  # Serves details about particular activity
  def show
    @activity = Activity.find(  params[:id],
                                :include => [:datetimes],
                                :conditions => [
                                    "datetimes.user_id = ?",
                                    current_user
                                ]
    )

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @activity }
    end
  end

  # Serves creation of new activity
  def new
    @activity = Activity.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @activity }
    end
  end

  # Serves editation of particular activity
  def edit
    @activity = Activity.find(  params[:id],
                                :include => [:datetimes],
                                :conditions => [
                                    "datetimes.user_id = ?",
                                    current_user
                                ]
    )
  end

  # Handles creation of activity
  def create
    @activity = Activity.new(params[:activity])

    respond_to do |format|
      if @activity.save
        format.html { redirect_to(@activity, :notice => 'Activity was successfully created.') }
        format.xml  { render :xml => @activity, :status => :created, :location => @activity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Handles modification of activity
  def update
    @activity = Activity.find(  params[:id],
                                :include => [:datetimes],
                                :conditions => [
                                    "datetimes.user_id = ?",
                                    current_user
                                ]
    )

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to(@activity, :notice => 'Activity was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Handles destroing of activity
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to(activities_url) }
      format.xml  { head :ok }
    end
  end
end
