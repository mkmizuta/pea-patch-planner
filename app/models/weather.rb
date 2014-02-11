class Weather < ActiveRecord::Base

  # Methods that allow access to current weather data

  def current_hash
    HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=Seattle&units=imperial").parsed_response
  end

  def current_description
    current_hash["weather"][0]["main"]
  end

  def current_temp
    current_hash["main"]["temp"]
  end

  # Methods that allow access to forecast weather data

  def forecast_array
    HTTParty.get("http://api.openweathermap.org/data/2.5/forecast/daily?q=Seattle&cnt=3&units=imperial&mode=json").parsed_response["list"]
  end

  def forecast_description
    description_array = []
    forecast_array.each do |day|
      description = day["weather"][0]["main"]
      description_array << description
    end
    description_array
  end

  def forecast_temp
    temp_array = []
    forecast_array.each do |day|
      temp = day["temp"]["day"]
      temp_array << temp
    end
    temp_array
  end
end