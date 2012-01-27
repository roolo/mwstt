class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @user_sessions = UserSession.new
  end

  def create
    @user_sessions = UserSession.new(params[:user_session])
    respond_to do |format|
      if @user_sessions.save
        format.html { 
          flash[:notice] = "Login successful!"
          redirect_to root_path
        }
        format.xml { head :ok }
      else
        format.html { render :action => :new }
        format.xml { head :error }
      end
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to login_path
  end
end
