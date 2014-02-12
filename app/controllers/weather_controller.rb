class WeatherController < ApplicationController

  def create
    create_forecast
    (0..2).each do |place_value|
      create_day(place_value)
      @day.save
    end
    redirect_to root_path
  end

  private

  def create_forecast
    @forecast = Weather.new
    @forecast.dt = Time.now
    @forecast.save
  end

  def create_day(place_value)
    @day = DaysWeather.new
    @day.forcast_association = Weather.last.id
    @day.temp = DaysWeather.forecast_temp
    @day.description = DaysWeather.forecast_description
  end
end