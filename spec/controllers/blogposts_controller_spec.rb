require 'spec_helper'

# To Run RSPEC as a single line rspec spec/controllers/blogposts_controller_spec.rb:94

describe BlogpostsController do

  describe 'GET #new' do

    it 'renders the form for new' do
      get 'new', blogpost: create(:blogpost).id
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    
    context 'with valid attributes' do
      let(:valid_attributes) { {title: "Title", post_text: "Test", user_id: 1} }

      it 'a redirect' do
        post :create, blogpost: valid_attributes
        expect(response.status).to eq 302
      end

      it 'changes blog count by 1' do
        post :create, blogpost: valid_attributes
        expect { post :create, blogpost: valid_attributes }.to change(Blogpost, :count).by(1)
      end

      it 'sends a flash message' do
        post :create, blogpost: valid_attributes
        expect(flash[:notice]).to_not be_blank
      end
    end 

    context 'with invalid attributes' do
      it 'does not create a new blog' do
        expect { post :create, blogpost: {title: "Blah", post_text: nil, user_id: 1 }}.to change(Blogpost, :count).by(0)
      end

      it 'renders the new template' do
        post :create, blogpost: {title: "Blah", post_text: nil, user_id: 1}
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #show' do
    let(:blogpost) { create(:blogpost) }
    let(:valid_attributes) { {title: blogpost.title, post_text: blogpost.post_text, user_id: blogpost.user_id} }

    it 'assigns the requested blogpost to @blogpost' do
      get :show, id: blogpost
      expect(assigns(:blogpost)).to eq(blogpost)
    end

    it "renders the :show template" do
      get :show, id: blogpost
      expect(response).to render_template :show
    end
  end

  describe 'GET #index' do
    let(:blogpost) { create(:blogpost) }
    let(:valid_attributes) { {title: blogpost.title, post_text: blogpost.post_text, user_id: blogpost.user_id} }

    it 'shows index view' do
      get :index
      expect(response).to render_template :index
    end

    it 'assigns all blogs to @blogs' do
      get :index
      expect(assigns(:blogposts)).to eq([blogpost])
    end 
  end

  describe 'GET #edit' do
    let(:blogpost) { create(:blogpost) }
    let(:valid_attributes) { {title: blogpost.title, post_text: blogpost.post_text, user_id: blogpost.user_id} }

    it "is successful" do
      get :edit, id: blogpost.id
      expect(response).to be_successful
    end

    it "locates the requested list" do
      get :edit, id: blogpost.id
      expect(assigns(:blogpost).id).to eq(blogpost.id)
    end

    it 'expects blog id to not be nil' do
      get :edit, id: blogpost.id
      expect(assigns(:blogpost).id).to_not be_nil
    end
  end

  describe 'PATCH #update' do
    
    context "with valid attributes" do
      let(:blogpost) { create(:blogpost) }
      let(:valid_attributes) { {title: "new title", post_text: blogpost.post_text, user_id: blogpost.user_id} }

      it "locates the requested blogpost" do
        patch :update, id: blogpost.id
        expect(assigns(:blogpost).id).to eq(blogpost.id)
      end

      it "updates the blogpost's attributes" do
        patch :update, id: blogpost.id, blogpost: valid_attributes
        blogpost.reload
        expect(blogpost.title).to eq("new title")
      end

      it "redirects user to blogpost's show page" do
        patch :update, id: blogpost.id, blogpost: valid_attributes
        expect(response).to redirect_to blogpost
      end
    end

    context "with invalid attributes" do
      let(:blogpost) { create(:blogpost) }
      let(:invalid_attributes) { {title: nil, post_text: blogpost.post_text, user_id: blogpost.user_id} } 

      it "does NOT update the blogpost's attributes" do
        old_title = blogpost.title
        patch :update, id: blogpost.id, blogpost: invalid_attributes
        blogpost.reload
        expect(blogpost.title).to eq(old_title)
      end

      it "re-renders the blogpost's edit page" do
        patch :update, id: blogpost.id, blogpost: invalid_attributes
        expect(response).to redirect_to edit_blogpost_path(blogpost)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:blogpost) { create(:blogpost) }
    
    it 'deletes the blog post and changes count by -1' do
      blogpost.reload
      expect { delete :destroy, id: blogpost.id }.to change(Blogpost, :count).by(-1)

    end

    it 'is a redirect' do
      delete :destroy, id: blogpost.id
      expect(response.status).to eq 302
    end
  end
end
