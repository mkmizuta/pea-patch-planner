class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password, :password_confirmation))
    if @user.save
      session[:id] = @user.id
      flash[:notice] = "You're now a farmer!"
      redirect_to @user
    else
      render action: :new
    end
  end

  def update
    if current_user.update params.require(:user).permit(:email)
      redirect_to user_path
    else
      render_template :email
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def email
  end

  def save_email
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
