class CurrentWeather < ActiveRecord::Base
  # Methods that allow access to current weather data

  def current_hash
    HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=Seattle&units=imperial").parsed_response["weather"][0]["main"]
  end

  def self.current_description
    current_hash["weather"][0]["main"]
  end

  def current_temp
    current_hash["main"]["temp"]
  end
end