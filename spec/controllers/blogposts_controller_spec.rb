require 'spec_helper'

describe BlogpostsController do

  describe 'GET #new' do
    

    it 'renders the form for new'

    it 'expects blog id to not be nil' do
      get 'new', blogpost_id: create(:blogpost).id
      expect(assigns(:blogpost).id).to_not be_nil
    end
  end

  describe 'POST #create' do
    before :each do
      user = create(:user)
      session[:user_id] = user.id
    end
    
    context 'when an existing admin submits' do
    
    context 'with valid attributes' 
      let(:user) { create(:blogpost) }
      let(:valid_attributes) { {title: "blogposttitle", post_text: "Etc, Etc, Etc", user_id: user.id} }
      
      it "is a redirect" do
        blogpost :create, blogpost: valid_attributes
        expect(response.status).to redirect_to blogpost_path(blogpost)
      end 

      it 'creates a new blog' do
        blogpost :create, blogpost: valid_attributes
        expect(blogpost.id).to_not be_nil
      end

      it 'a redirect' do
        blogpost :create, blogpost: valid_attributes
        expect(reponse.status).to eq 302
      end

      it 'changes blog count by 1' do
        expect { blogpost :create, blogpost: valid_attributes }.to change(Blogpost, :count).by(1)
      end

      it 'sends a flash message' do
        blogpost :create, blogpost: valid_attributes
        expect(flash[:notice]).to_not be_blank
      end
    end 

    context 'with non-valid attributes' do
      it 'does not create a new blog'
      it 'renders the new template'
    end
  end

  describe 'GET #show' do
    it 'assigns the requested blog to @blog'
  end

  describe 'GET #index' do
    it 'shows a list of all the blogs'
    it 'assigns all blogs to @blogs'
    
  end

  describe 'POST #edit' do
  end

  describe 'POST #update' do
    it 'edits the blog'
    it 'is a redirct to show page'
    it 'does not change blog count'
  end

  describe 'DELETE #destroy' do
    it 'deletes the blog post'
    it 'is a redirect'
    it 'changes blog count by -1'
  end

end
