require 'spec_helper'

  describe UsersController do
    describe "GET #new" do

      it "assigns a new User to @user" do
        get :new
        expect(assigns(:user)).to be_a_new(User)
      end

      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end


  describe "POST 'create'" do
    context "with valid attributes" do
      let(:valid_attributes) { {username: "farmer", email: "farmer@farmer.com", password: "pass1234", password_confirmation: "pass1234"} }


      it "is a redirect to users#show" do
        post :create, user: valid_attributes
        expect(response.status).to eq 302 
      end 

      it "changes user count by 1" do
        expect { post :create, user: valid_attributes }.to change(User, :count).by(1)
      end

      it "sets a flash message" do
        post :create, user: valid_attributes
        expect(flash[:notice]).to_not be_blank
      end
    end
        
    context "with invalid attributes" do
      it "renders the new template" do
        post :create, user: {username: "m"}
        expect(response).to render_template :new
      end
    
      it "does not create a user" do
        expect { post :create, user: {username: "m"} }.to change(User, :count).by(0)
      end
    end
  end

  describe "PATCH 'update" do
    let(:user) { create(:user) }
    before do 
      session[:id] = user.id
    end

    it "redirects to @users profile page" do
      patch :update, user: {email: "b@email.com"}
      expect(response).to redirect_to user_path
    end

    context "with invalid attributes" do
      it "render the new email template" do
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
