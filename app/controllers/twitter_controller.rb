class TwitterController < ApplicationController

  def index
  end
  
  def welcome
  end

  def create
    current_user = User.from_omniauth(env['omniauth.auth'])
    session[:id] = current_user.id
    redirect_to user_email_path
    # redirect_to root_url, notice: "Signed in."
  end

  # get email after twitter api signin; use redirect for form to get email, etc. revisit validations, etc.

  def signin
    redirect_to "auth/twitter"
  end

  def signout
    session[:id] = nil
    redirect_to :root
  end

end

