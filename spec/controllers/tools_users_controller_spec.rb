require 'spec_helper'

describe ToolsUsersController do
  describe "POST create" do
    context "with valid attributes" do
      it "saves to the database" 
      it "directs user to their profile page"
    end

    context "with invalid attributes" do
      it "requires user to be logged in"
      it "assigns an error message"
      it "redirects user to the sign_in page"
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
