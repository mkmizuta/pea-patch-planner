class SessionsController < ApplicationController


  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:id] = user.id
      redirect_to :root, notice: 'Successfully signed in'
    else
      render :new
      flash[:notice] = "Invalid username or password"
    end
  end

  def destroy
    session[:id] = nil
    redirect_to :root
    flash[:notice]= "Thanks for visiting"
  end
end



  # skip_before_action :verify_authenticity_token
  # skip_before_action :check_current_user
  # skip_before_action :require_current_user

#   def welcome
#   end

#   def index
#   end

#   def create
#     auth_hash = request.env['omniauth.auth']
#     if auth_hash["uid"]
#       @user = User.find_or_create_from_omniauth(auth_hash)
#       if @user
#         session[:user_id] = @user.id
#         redirect_to "/"
#       else
#         redirect_to "/", notice: "Failed to save user."
#       end
#     else
#       redirect_to "/", notice: "Failed to authenticate. Please try a dragon."
#     end
#   end

#   def sign_in
#     redirect_to "/auth/twitter"
#   end

#   def sign_out
#     session[:user_id] = nil
#     redirect_to "/", notice: "You have been successfully signed out."
#   end

#   protected

#   def auth_hash
#     request.env['omniauth.auth']
#   end
  
# end

