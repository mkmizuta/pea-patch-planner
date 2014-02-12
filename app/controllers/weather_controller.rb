class WeatherController < ApplicationController

  def create
    create_forecast
    (0..2).each do |place_value|
      create_day(place_value)
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
    @day.forecast_association = Weather.last.id
    @day.temp = @day.forecast_temp(place_value)
    @day.description = @day.forecast_description(place_value)
    @day.place_value = place_value
    @day.save
  end
end