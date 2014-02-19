class UsersController < ApplicationController

  def update
    @user = User.find(current_user.id)
    if @user.update(params.require(:user).permit(:email))
      
      UserMailer.welcome(@user.id).deliver
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
