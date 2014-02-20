class WelcomeController < ApplicationController
  
  def index
    @weather = Weather.new
    @events = Event.all(:order => 'start_time ASC', :limit => 5)
  end



end
