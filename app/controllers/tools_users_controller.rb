class ToolsUsersController < ApplicationController

  def create
      @tools_users = ToolsUsers.new(checkout_params)
      @tools_users.save
      redirect_to :user
  end

  private

  def checkout_params
    params.require(:tools_users).permit(:tool_id, :user_id, :checkout, :checkin)
  end

end
