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

  def update
    @user = User.find(current_user.id)
    if @user.update(params.require(:user).permit(:email))
      redirect_to :root # current_user
    else
      render :email
    end
  end

  def show
    @user = current_user
  end

  def edit
  end

  def email
    @user = User.find(current_user.id)
  end

  def save_email
  end

  private
  def user_params
    params.require(:user).permit(:username, :email)
  end
end
