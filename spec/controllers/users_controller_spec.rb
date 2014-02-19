require 'spec_helper'

describe UsersController do
  
  describe "PATCH 'update'" do
    let(:user) { create(:user) }
    before do 
      session[:id] = user.id
    end

    it "redirects to @users profile page" do
      patch :update, user: {email: "b@email.com"}
      expect(response).to redirect_to user_path
    end

    context "with invalid attributes" do
      it "renders the new email template" do
        patch :update, user: {email: "b.com"}
        expect(response).to render_template :email
      end
    end 
  end

  describe "GET 'show'" do
    let(:user) { create(:user) }
    
    it "is successful" do
      get :show, id: user.id
      expect(response).to be_successful
    end
  end
end
