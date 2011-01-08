class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def new
    @user_sessions = UserSession.new
  end
  
  def create
    @user_sessions = UserSession.new(params[:user_session])
    if @user_sessions.save
      flash[:notice] = "Login successful!"
      redirect_to root_path
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to login_path
  end
end