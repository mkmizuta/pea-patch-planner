class TwitterController < ApplicationController

  def index
  end
  
  def welcome
  end

  def create
    current_user = User.from_omniauth(env['omniauth.auth'])
    session[:id] = current_user.id

    redirect_to :root # current_user
  end

  def signin
    redirect_to "auth/twitter"
  end

  def signout
    session[:id] = nil
    redirect_to :root
  end
end

