class Weather < ActiveRecord::Base
  has_many :days_weathers
  validates :dt, presence: true

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


end