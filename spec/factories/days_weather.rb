FactoryGirl.define do
  factory :days_weather do
    temp                '32'
    description         'Snow'
    place_value          1
    forecast_association 1

  end

end
  # belongs_to :weather
  # validates :temp, presence: true
  # validates :description, presence: true
  # validates :place_value, presence: true
  # validates :forecast_association, presence:true
