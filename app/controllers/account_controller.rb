class AccountController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:index, :update, :edit]
  
  def index
    @user = current_user

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  def new
    @user = User.new
    @form_action = 'create'

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  # Handles creation of user - Registration
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(root_path, :notice => 'Registration was successful.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # GET /users/1/edit
  def edit
    @user = current_user
    @form_action = 'create'

    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = t('Account was successfully updated.')
        format.html { redirect_to :controller=>'account' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
end
