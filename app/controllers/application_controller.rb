class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :ensure_email,:except => [:email, :update]

  def current_user
    current_user ||= User.find(session[:id]) if session[:id]
  end

  def ensure_email
    if current_user && current_user.email.nil?
      redirect_to user_email_path
    end
  end

  helper_method :current_user
end
