class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:uid] = user.uid
      redirect_to :root, notice: 'Successfully signed in'
    else
      render :new
      flash[:notice] = "Invalid username or password"
    end
  end

  def destroy
    session[:uid] = nil
    redirect_to :root
    flash[:notice]= "Thanks for visiting"
  end
end
