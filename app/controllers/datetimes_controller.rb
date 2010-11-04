class DatetimesController < ApplicationController
  # GET /datetimes
  # GET /datetimes.xml
  def index
    @datetimes = Datetime.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @datetimes }
    end
  end
  
  # GET /datetimes/1
  # GET /datetimes/1.xml
  def show
    @datetime = Datetime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @datetime }
    end
  end
  
  # GET /datetimes/new
  # GET /datetimes/new.xml
  def new
    @datetime = Datetime.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @datetime }
    end
  end

  # GET /datetimes/1/edit
  def edit
    @datetime = Datetime.find(params[:id])
  end

  # POST /datetimes
  # POST /datetimes.xml
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

  # PUT /datetimes/1
  # PUT /datetimes/1.xml
  def update
    @datetime = Datetime.find(params[:id])

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

  # DELETE /datetimes/1
  # DELETE /datetimes/1.xml
  def destroy
    @datetime = Datetime.find(params[:id])
    @datetime.destroy

    respond_to do |format|
      format.html { redirect_to(datetimes_url) }
      format.xml  { head :ok }
    end
  end
end
