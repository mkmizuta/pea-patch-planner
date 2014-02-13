require 'spec_helper'

describe PostsController do

  describe 'GET #new' do
    get 'new', id: create(:post).id

    it 'renders the form for new'

    it 'expects blog id to not be nil' do
    expect(assigns(:posts).id).to_not be_nil
  end

  describe 'POST #create' do
    before :each do
      blog = create(:blog)
    end

    context 'with valid attributes' do
      let(:valid_attributes) { {title: "Hello", post_text: "Hello World", user_id: session[:user_id] } }
      it 'creates a new blog'
      it 'a redirect'
      it 'changes blog count by 1'
      it 'sends a flash message'

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
