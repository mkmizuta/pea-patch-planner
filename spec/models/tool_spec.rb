require 'spec_helper'

describe Tool do
  describe "validations" do
    let(:tool) {create(:tool)}
    it "has a valid factory" do
      expect(tool).to be_valid
    end

    it "has a name" do
      tool.update(name: nil)
      expect(tool.errors[:name]).to_not be_empty
    end

    it "has a description" do
      tool.update(description: nil)
      expect(tool.errors[:description]).to_not be_empty
    end
    it "has an owner" do
      tool.update(owner: nil)
      expect(tool.errors[:owner]).to_not be_empty
    end
  end
end