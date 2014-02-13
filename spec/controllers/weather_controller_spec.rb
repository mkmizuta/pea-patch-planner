require 'spec_helper'

describe WeatherController do

  describe "POST create" do
    context "with valid attributes" do
      let(:forecast)       {{id: 1, dt: '2014-02-12'}}
      let(:days_weather)   {{id: 1, temp: 34.5, description: "Snow", 
                              place_value: 0, forecast_association: 1}}

      it "saves a forecast and a days_weather to the database" do
        expect{post :create, weather: forecast}.to change(Weather, :count).by(1)
        expect{post :create, days_weather: days_weather}.to change(Weather, :count).by(1)
      end

      it "redirects to the homepage" do
        post :create, weather: forecast
        expect(response.status).to eq 302
      end
    end

    context "with invalid forecast" do
      xit "does not save to the database" do
        expect{post :create, weather: {id: 1}}.to change(Weather, :count).by(0)
      end 

      xit "displays a notice of weather error" do
        post :create, weather: {id: 1}
        expect(flash[:notice]).to_not be_blank
      end
    end

    context "with invalid days_weather" do
      xit "does not save to the database" do
        expect{post :create, days_weather: {temp: 45.1}}.to change(DaysWeather, :count).by(0)
      end
    end
  end
end