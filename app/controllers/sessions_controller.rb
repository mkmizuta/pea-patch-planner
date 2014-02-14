class SessionsController < ApplicationController
  protect_from_forgery


  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:username])
    auth = { provider: user.provider, uid: user.uid }
    if user && User.authenticate(params[:username], params[:password])
      session[:id] = user.id
      redirect_to :root, notice: 'Successfully signed in'
    elsif user && User.from_omniauth(auth)
      session[:id] = user.id
      redirect_to :root, notice: 'Successfully signed in with Twitter.'
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

  


