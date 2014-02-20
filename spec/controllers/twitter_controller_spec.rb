require 'spec_helper'

describe TwitterController do
  before(:each) do
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
    end

  context 'if user exists' do
    let!(:user) { User.create_from_omniauth(OmniAuth.config.mock_auth[:twitter]) }

      it 'assigns user to current user' do
        get :create
        expect(session[:user_id]).to eq assigns(:user).id
      end
    end
  end

