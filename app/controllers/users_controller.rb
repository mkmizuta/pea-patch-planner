class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password, :password_confirmation))
    if @user.save
      session[:id] = @user.id
      flash[:notice] = "You're now a farmer!"
      UserMailer.welcome(@user.id).deliver
      redirect_to @user
    else
      render action: :new
    end
  end

  def show
    user = User.find(params[:id])
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
