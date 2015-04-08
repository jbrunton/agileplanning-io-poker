require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let!(:room) { create(:room) }
  let!(:attendee) { create(:attendee, room: room) }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns the attendee_history if an attendee_history cookie is present" do
      request.cookies[:attendee_history] = "attendee:#{attendee.id}"
      get :index, {}, valid_session
      expect(assigns(:attendee_history)).to eq([attendee])
    end
  end

  describe "POST #join" do
    it "redirects to the join url for the room" do
      get :join, {:room_id => room.to_param}, valid_session
      expect(response).to redirect_to(room)
    end
  end
end
