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


#  before_action :check_current_user
#   before_action :require_current_user

#   def check_current_user
#     @current_user ||= User.find(session[:user_id]) if session[:user_id]
#   rescue ActiveRecord::RecordNotFound
#     session[:user_id] = nil
#     redirect_to welcome_path
#   end

#   def require_current_user
#     if check_current_user.nil?
#       redirect_to welcome_path

#     end
#   end
# end