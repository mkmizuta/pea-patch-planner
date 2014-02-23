require 'spec_helper'

describe ToolsUsers do

  describe "validations" do

    let(:tools_users) {create(:tools_users)}

    it "has a valid factory" do
      expect(tools_users).to be_valid
    end

    it "has a tool_id" do
      tools_users.update(tool_id: nil)
      expect(tools_users.errors[:tool_id]).to_not be_empty
    end

    it "has a user_id" do
      tools_users.update(user_id: nil)
      expect(tools_users.errors[:user_id]).to_not be_empty
    end
    
    it "has a checkout datetime" do
      tools_users.update(checkout: nil)
      expect(tools_users.errors[:checkout]).to_not be_empty
    end
  end
end
