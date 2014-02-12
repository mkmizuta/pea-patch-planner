class AddPlaceValueToDaysWeather < ActiveRecord::Migration
  def change
    add_column :days_weathers, :place_value, :integer
  end
end
