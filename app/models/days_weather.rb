class DaysWeather < ActiveRecord::Base
  belongs_to :weather
  validates :temp, :description, :place_value, :forecast_association, presence: true

  # Methods that allow access to forecast daily weather data

  def forecast_array
    @forecast ||= HTTParty.get("http://api.openweathermap.org/data/2.5/forecast/daily?q=Seattle&cnt=3&units=imperial&mode=json").parsed_response["list"]
  end

  def forecast_description(place_value)
    forecast_array[place_value]["weather"][0]["main"]
  end

  def forecast_temp(place_value)
    forecast_array[place_value]["temp"]["day"]
  end
end