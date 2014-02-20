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
    it "correctly assigns active checkouts to @tools_users" do
      get :current_checkouts

      expect(assigns(:tools_users)).to eq([tools_users])
    end

    it "renders the current_checkouts page" do
      get :current_checkouts

      expect(response).to render_template :current_checkouts
    end
  end

  describe "GET logs" do
    it "correctly assigns all the checkouts to @tools_users" do
      get :logs

      expect(assigns(:tools_users)).to eq([tools_users])
    end

    it "renders the logs page" do
      get :logs

      expect(response).to render_template :logs
    end
  end

  describe "PATCH update" do
    it "correctly locates and assigns the checkin to @tools_users" do
      @attr = { checkin: Time.now }
      patch :update, id: tools_users.id, tools_users: @attr
      tools_users.reload

      expect(assigns(:tools_users)).to eq(tools_users)
    end

    it "updates the checkout in the database" do
      @attr = { checkin: Time.now }
      patch :update, id: tools_users.id, tools_users: @attr
      tools_users.reload

      expect(tools_users[:checkin]).to_not be_blank
    end

    it "directs user to their profile page" do
      @attr = { checkin: Time.now }
      patch :update, id: tools_users.id, tools_users: @attr
      tools_users.reload

      expect(response.status).to eq 302
    end
  end
end
