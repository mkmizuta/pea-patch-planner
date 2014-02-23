class UsersController < ApplicationController

  def update
    @user = User.find(current_user.id)
    if @user.update(params.require(:user).permit(:email))
      
      Resque.enqueue(NewsJob, @user.id) if @user.email
      redirect_to :root # current_user
    else
      render :email
    end
  end

  def show
    @user = current_user
    @tools = Tool.where(["owner = #{@user.id}"])
    @tools_users = ToolsUsers.where(["user_id = #{@user.id}" && "checkin IS NULL"])
  end

  def edit
  end

  def index
    @users = User.all

  end

  def update_user
    @user = User.find(params[:user][:id])
    
    if @user && @user.update(params[:user].permit(:admin))
      redirect_to :root
    else
      redirect_to users_index_path
    end
  end

  def email
    @user = User.find(current_user.id)
  end

  def save_email
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :admin)
  end

end
