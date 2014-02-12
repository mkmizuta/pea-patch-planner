class CreateDaysWeather < ActiveRecord::Migration
  def change
    create_table :days_weathers do |t|
      t.string :description
      t.integer :forecast_association
      t.float :temp
      t.string :icon
    end
  end
end
