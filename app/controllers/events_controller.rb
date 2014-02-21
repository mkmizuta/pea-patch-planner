class EventsController < ApplicationController


  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to :root
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end



  private

  def event_params
    params.require(:event).permit(:name, :start_time, :location, :description)
  end
end