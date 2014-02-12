class TwitterController < ApplicationController

  def index
  end
  
  def search
    @users = TwitterFeed.client.user_search(params[:user_name])
    if @users.empty?
      redirect_to "/", notice: "No match found.  <a onclick=\"textBoxFocus('user_name')\">Please search again.</a>".html_safe 
    end
  end



end