require 'spec_helper'

describe ToolsUsersController do
  let(:tools_users) {create(:tools_users)}

  describe "POST create" do
    let(:valid_attributes) {{tool_id: 1, user_id: 1, checkout: Time.now}}
    let(:invalid_attributes) {{tool_id: 1, user_id: nil, checkout: Time.now}}

    context "with valid attributes" do
      it "saves to the database" do
        expect {post :create, tools_users: valid_attributes}.to change(ToolsUsers, :count).by(1)
      end

      it "directs user to their profile page" do
        post :create, tools_users: valid_attributes
        expect(response.status).to eq 302
      end
    end

    context "with invalid attributes" do

      xit "assigns an error message" do
        post :create, tools_users: invalid_attributes
        expect(flash[:notice]).to_not be_blank
      end
    end
  end

  describe "GET current_checkouts" do
    it "correctly assigns active checkouts to @tools_users"
    it "renders the current_checkouts page"
  end

  describe "GET logs" do
    it "correctly assigns all the checkouts to @tools_users"
    it "renders the logs page"
  end

  describe "PATCH update" do
      it "correctly locates and assigns the checkout to @tools_users"
      it "updates the checkout in the database"
      it "directs user to their profile page"
  end
end
