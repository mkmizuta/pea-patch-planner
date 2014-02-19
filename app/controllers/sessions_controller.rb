class SessionsController < ApplicationController
  protect_from_forgery

  def destroy
    session[:id] = nil
    redirect_to :root
    flash[:notice]= "Thanks for visiting!"
  end
end

  


