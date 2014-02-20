require 'spec_helper'

describe EventsController do
  let(:event) { create(:event) }
  let(:valid_attributes) { {name: "Dance Party", start_time: "2014-02-19 20:52:07" }}
  let(:invalid_attributes) {{name: nil, start_time: nil }}

  describe "GET new" do
    
    it "renders the new template" do
      get :new
      
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
  context "with valid attributes" do

    it "increases the count of events by 1" do
      expect {post :create, event: valid_attributes}.to change(Event, :count).by(1)
    end

    it "directs user to the event show page" do
      post :create, event: valid_attributes

      expect(response.status).to eq 302
    end
  end

  end
end