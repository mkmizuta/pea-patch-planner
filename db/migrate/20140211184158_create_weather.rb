class CreateWeather < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.datetime :dt
    end
  end
end
