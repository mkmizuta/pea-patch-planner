require 'spec_helper'

# To Run RSPEC as a single line rspec spec/controllers/blogposts_controller_spec.rb:94

describe BlogpostsController do

  describe 'GET #new' do

    it 'renders the form for new' do
      get 'new', blogpost: create(:blogpost).id
      expect(response).to render_template :new
    end

    it 'expects blog id to not be nil' do
      get 'new', blogpost: create(:blogpost).id
      expect(assigns(:blogpost).id).to_not be_nil
    end
  end

  describe 'POST #create' do
    
    context 'with valid attributes' do
      let(:blogpost) { create(:blogpost) }
      let(:valid_attributes) { {title: "blogposttitle", post_text: "Etc, Etc, Etc", user_id: 9} }
      
      it "is a redirect" do
        post :create, blogpost: valid_attributes
        expect(response.status).to redirect_to blogpost_path(blogpost)
      end 

      it 'creates a new blog' do
        post :create, blogpost: valid_attributes
        expect(blogpost.id).to_not be_nil
      end

      it 'a redirect' do
        post :create, blogpost: valid_attributes
        expect(reponse.status).to eq 302
      end

      it 'changes blog count by 1' do
        post :create, blogpost: valid_attributes
        expect { blogpost :create, blogpost: valid_attributes }.to change(Blogpost, :count).by(1)
      end

      it 'sends a flash message' do
        post :create, blogpost: valid_attributes
        expect(flash[:notice]).to_not be_blank
      end
    end 

    context 'with invalid attributes' do
      let(:blogpost) { create(:blogpost) }
      let(:invalid_attributes) { {title: "blogposttitle", post_text: " ", user_id: 9} }

      it 'does not create a new blog' do
        expect { post :create, blogpost: invalid_attributes }.to change(Blogpost, :count).by(0)
      end

      it 'renders the new template' do
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #show' do
    let(:blogpost) { create(:blogpost) }
    let(:valid_attributes) { {title: "blogposttitle", post_text: "Etc, Etc, Etc", user_id: 1} }

    it 'assigns the requested blogpost to @blogpost' do
      get :show, id: @blogpost
      expect(assigns(:blogpost)).to eq(@blogpost)
    end

    it "renders the :show template" do
      get :show, id: blogpost
      expect(response).to render_template :show
    end
  end

  describe 'GET #index' do
    let(:blogpost) { create(:blogpost) }
    let(:valid_attributes) { {title: "blogposttitle", post_text: "Etc, Etc, Etc", user_id: 1} }

    it 'shows index view' do
      get :index
      expect(response).to render_template :index
    end

    it 'assigns all blogs to @blogs' do
      get :index
      expect(assigns(:blogposts)).to eq([blogpost])
    end 
  end

  describe 'POST #edit' do
    let(:blogpost) { create(:blogpost) }
    let(:valid_attributes) { {title: "blogposttitle", post_text: "Etc, Etc, Etc", user_id: 1} }

    it "is successful" do
      get :edit, id: blogpost.id
      expect(response).to be_successful
    end

    it "locates the requested list" do
      get :edit, id: blogpost.id
      expect(assigns(:blogpost).id).to eq(blogpost.id)
    end
  end

  describe 'POST #update' do
    
    context "with valid attributes" do
      let(:blogpost) { create(:blogpost) }
      let(:valid_attributes) { {title: "blogposttitle", post_text: "Etc, Etc, Etc", user_id: 1} }

      it "locates the requested blogpost" do
        patch :update, id: blogpost.id
        expect(assigns(:blogpost).id).to eq(blogpost.id)
      end

      it "updates the blogpost's attributes" do
        patch :update, id: blogpost.id
        blogpost.reload
        expect(@blogpost.title).to eq("blogposttitle")
      end

      it "redirects user to blogpost's show page" do
        patch :update, id: blogpost.id
        expect(response).to redirect_to blogpost
      end
    end

    context "with invalid attributes" do
      let(:blogpost) { create(:blogpost) }
      let(:invalid_attributes) { {title: " ", post_text: "Etc, Etc, Etc", user_id: 1} }      

      it "locates the requested blogpost" do
        patch :update, id: blogpost.id
        expect(assigns(:blogpost)).to eq(blogpost)
      end

      it "does NOT update the blogpost's attributes" do
        patch :update, id: blogpost.id
        blogpost.reload
        expect(blogpost.title).to eq("Blog What?")
      end

      it "re-renders the blogpost's show page" do
        patch :update, id: blogpost.id
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:blogpost) { create(:blogpost) }
    let(:valid_attributes) { {title: "blogposttitle", post_text: "Etc, Etc, Etc", user_id: 1} }

    it 'deletes the blog post and changes count by -1' do
      expect{ delete :destroy, id: blogpost.id }.to change(Blogpost, :count).by(-1)
    end

    it 'is a redirect' do
      get :delete, blogpost: valid_attributes
      expect(response.status).to eq 302
    end
  end
end
