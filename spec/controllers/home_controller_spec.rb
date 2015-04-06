require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let!(:room) { create(:room) }
  let!(:attendee) { create(:attendee, room: room) }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns the room_history if a room_history cookie is present" do
      request.cookies[:room_history] = "attendee:#{attendee.id}"
      get :index, {}, valid_session
      expect(assigns(:room_history)).to eq([attendee])
    end
  end
end
