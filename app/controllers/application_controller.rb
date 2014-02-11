class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  

  def current_user
    if session[:uid]
      @current_user ||= User.find(session[:uid])
    else
      @current_user = nil
    end
  end

  helper_method :current_user
end
