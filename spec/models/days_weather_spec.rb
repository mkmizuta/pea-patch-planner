require 'spec_helper'

describe DaysWeather do
  let(:days_weather) {create(:days_weather)}

  describe "validations" do
    
    it "is valid" do
      expect(days_weather).to be_valid
    end

    it "has a temp" do
      days_weather.update(temp: nil)
      expect(days_weather.errors[:temp]).to_not be_empty
    end

    it "has a description" do
      days_weather.update(description: nil)
      expect(days_weather.errors[:description]).to_not be_empty
    end

    it "has a place_value" do
      days_weather.update(place_value: nil)
      expect(days_weather.errors[:place_value]).to_not be_empty
    end

    it "has a forecast_association" do
      days_weather.update(forecast_association: nil)
      expect(days_weather.errors[:forecast_association]).to_not be_empty
    end
  end

  describe "association" do
    it "responds to #weather (forecast)" do
      expect(days_weather).to respond_to(:weather)
    end
  end
end