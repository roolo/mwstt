class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  before_filter :set_locale
  before_filter :set_timezone
  rescue_from ActiveRecord::RecordNotFound, :with => :rescue_action_in_public

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to account_url
      return false
    end
  end
  
  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to '/login'
      return false
    end
  end
  
  def store_location
    session[:return_to] = request.fullpath
  end
  
  def set_locale
    # if params[:locale] is nil then I18n.default_locale will be used
    unless current_user.nil?
      I18n.locale = Locale.find(current_user.locales_id).locale_code
    end
  end

  def set_timezone
    Time.zone = current_user.timezone if current_user
  end

  # handles 404 when a record is not found.
  def rescue_action_in_public(exception)
    case exception
    when ActiveRecord::RecordNotFound, ActionController::UnknownAction, ActionController::RoutingError
      render :file => "#{RAILS_ROOT}/public/404.html", :layout => 'layouts/application', :status => 404
    else
      super
    end
  end

end
