require 'spec_helper'

  describe UsersController do
    describe 'GET new' do
      it "renders a new template" do
        get :new
        expect(response).to render_template :new
      end
    end
  end

