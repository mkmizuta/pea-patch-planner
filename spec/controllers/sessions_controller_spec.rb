require 'spec_helper'

describe SessionsController do


  describe 'Delete #destroy' do
    context "when a user signs out" do
      let(:user) { create(:user) }
      before do 
        session[:id] = user.id
      end
      it "the id in session should be nil" do
        post :destroy, id: user.id
        expect(session[:id]).to eq nil
      end

      it "There should be a flash notice" do
        post :destroy, id: user.id
        expect(flash[:notice]).to_not be_blank
      end
    end
  end
end
