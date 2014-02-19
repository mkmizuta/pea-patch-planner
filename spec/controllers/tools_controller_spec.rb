require 'spec_helper'
describe ToolsController do

  let(:tool) { create(:tool) }
  let(:valid_attributes) { {name: "wheelbarrow", description: "red and helpful", owner: 1}}
  let(:invalid_attributes) {{name: nil, description: nil, owner: 0}}

  describe "GET new" do
    
    it "renders the new template" do
      get :new
      
      expect(response).to render_template :new
    end
  end

  describe "POST create" do

    context "with valid attributes" do

      it "increments the count of tools by 1" do
        expect {post :create, tool: valid_attributes}.to change(Tool, :count).by(1)
      end

      it "directs user to the tool show page" do
        post :create, tool: valid_attributes
        expect(response.status).to eq 302
      end

    end
    
    context "with invalid attributes" do
      
      it "does not increment the count of tools" do
        expect {post :create, tool: invalid_attributes}.to change(Tool, :count).by(0)
      end

      it "displays an error notice" do
        post :create, tool: invalid_attributes
        expect(flash[:notice]).to_not be_blank
      end

      it "directs user back to the 'new' page" do
        post :create, tool: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe "GET show" do
    it "correctly locates and assigns @tool" do
      get :show, id: tool.id

      expect(assigns(:tool)).to eq(tool)
    end

    it "directs user to the @tool's show page" do
      get :show, id: tool.id
      
      expect(response).to render_template :show
    end
  
  end

  describe "GET index" do
    it "correctly accesses and assigns @tools" do
      
    end
    it "directs user to the @tools' index page" do
      
    end
  end

  describe "GET edit" do
    it "correctly accesses and assignes @tool"
    it "directs user to the @tool edit page"
  end

  describe "PATCH update" do
    it "correctly accesses and assigns @tool"
    context "with valid attributes" do
      it "saves the updated version of @tool to the database"
      it "redirects to the @tool's show page"
    end
    context "with invalid attributes" do
      it "does not update version of @tool in the database"
      it "displays a notice to the user"
      it "displays the tool's edit page"
    end
  end

  describe "DELETE destroy" do
    it "correctly locates and assigns @tool"
    it "removes @tool from the database"
    it "redirects user to the tool index page"
  end
end