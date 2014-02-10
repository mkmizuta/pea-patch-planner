require 'spec_helper'

describe User do
  let(:user) {create(:user)}

  describe 'validations' do
    it "is a valid user" do
      expect(user).to be_valid
    end

  end


end



