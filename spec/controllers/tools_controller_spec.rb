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
      get :index

      expect(assigns(:tools)).to eq([tool])
    end

    it "directs user to the @tools' index page" do
      get :index

      expect(response).to render_template :index
    end
  end

  describe "GET edit" do

    it "correctly accesses and assignes @tool" do
      get :edit, id: tool.id

      expect(assigns(:tool)).to eq(tool)
    end

    it "directs user to the @tool edit page" do
      get :edit, id: tool.id

      expect(response).to render_template :edit
    end
  end

  describe "PATCH update" do

    it "correctly accesses and assigns @tool" do
      patch :update, id: tool.id, tool: valid_attributes
      tool.reload

      expect(assigns(:tool)).to eq(tool)
    end

    context "with valid attributes" do

      it "saves the updated version of @tool to the database" do
        original_name = tool.name
        patch :update, id: tool.id, tool: valid_attributes
        tool.reload

        expect(tool[:name]).to_not eq(original_name)
      end

      it "redirects to the @tool's show page" do
        patch :update, id: tool.id, tool: valid_attributes
        tool.reload

        expect(response.status).to eq 302
      end
    end

    context "with invalid attributes" do

      it "does not update version of @tool in the database" do
        original_name = tool.name
        patch :update, id: tool.id, tool: invalid_attributes
        tool.reload

        expect(tool[:name]).to eq(original_name)
      end

      it "displays a notice to the user" do
        patch :update, id: tool.id, tool: invalid_attributes
        tool.reload

        expect(flash[:notice]).to_not be_blank
      end

      it "displays the tool's edit page" do
        patch :update, id: tool.id, tool: invalid_attributes
        tool.reload

        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE destroy" do
    it "correctly locates and assigns @tool"
    it "removes @tool from the database"
    it "redirects user to the tool index page"
  end
end