# Handles datetimes maintenace
class DatetimesController < ApplicationController
  before_filter :require_user
  
  # Serves listing of existing datetimes
  def index
    @datetimes = Datetime.find_all_by_user_id(  current_user,
                                                :order => 'stop DESC'
                 )
                 .paginate  :page => params[:page],
                            :per_page => Datetime.per_page,
                            :order => 'stop DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @datetimes }
    end
  end
  
  # Serves details about particular datetime
  def show
    @datetime = Datetime.find(  params[:id],
                                :conditions => [
                                    "datetimes.user_id = ?",
                                    current_user
                                ]
    )

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @datetime }
    end
  end
  
  # Serves creation of new datetime
  def new
    @datetime = Datetime.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @datetime }
    end
  end
  
  # Serves editation of particular datetime
  def edit
    @datetime = Datetime.find(  params[:id],
                                :conditions => [
                                    "datetimes.user_id = ?",
                                    current_user
                                ]
    )
  end

  # Handles creation of datetime
  def create
    @datetime = Datetime.new(params[:datetime])

    respond_to do |format|
      if @datetime.save
        format.html { redirect_to(@datetime, :notice => 'Datetime was successfully created.') }
        format.xml  { render :xml => @datetime, :status => :created, :location => @datetime }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @datetime.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # Handles modification of datetime
  def update
    @datetime = Datetime.find(  params[:id],
                                :conditions => [
                                    "datetimes.user_id = ?",
                                    current_user
                                ]
    )

    respond_to do |format|
      if @datetime.update_attributes(params[:datetime])
        format.html { redirect_to(@datetime, :notice => 'Datetime was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @datetime.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Handles destroing of datetime
  def destroy
    @datetime = Datetime.find(  params[:id],
                                :conditions => [
                                    "datetimes.user_id = ?",
                                    current_user
                                ]
    )
    @datetime.destroy

    respond_to do |format|
      format.html { redirect_to(datetimes_url) }
      format.xml  { head :ok }
    end
  end

  def set_in_ctt
    datetime = Datetime.find(  params[:id],
                                :conditions => [
                                    "datetimes.user_id = ?",
                                    current_user
                                ]
    )
    datetime.in_ctt = true

    respond_to do |format|
      if datetime.save
        format.html { redirect_to request.env['HTTP_REFERER'] }
        format.js {
          render :update do |page|
            page.replace 'set_ctt_'+datetime.id.to_s, :partial => 'datetime_actions', :locals => {:datetime => datetime}
            page.Element.addClassName("datetime_"+datetime.id.to_s, 'in_ctt')
          end
        }
      end
    end

  end

  def set_not_in_ctt
    datetime = Datetime.find(  params[:id],
                                :conditions => [
                                  "datetimes.user_id = ?",
                                  current_user
                                ]
    )
    datetime.in_ctt = false
    
    respond_to do |format|
      if datetime.save
        format.html { redirect_to request.env['HTTP_REFERER'] }
        format.js {
          render :update do |page|
            page.replace 'set_ctt_'+datetime.id.to_s, :partial => 'datetime_actions', :locals => {:datetime => datetime}
            page.Element.removeClassName("datetime_"+datetime.id.to_s, 'in_ctt')
          end
        }
      end
    end

  end
end
