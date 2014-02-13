require 'spec_helper'

describe Weather do

  describe "validations" do
    let(:weather) {create(:weather)}
    it "is valid" do
      expect(weather).to be_valid
    end

    it "has a date time" do
      weather.update(dt: nil)
      expect(weather.errors[:dt]).to_not be_empty
    end
  end

  
end