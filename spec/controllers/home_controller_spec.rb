require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let!(:room) { create(:room) }
  let!(:attendee) { create(:attendee, room: room) }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns the attendee if an attendee_id cookie is present" do
      request.cookies[:attendee_id] = attendee.to_param
      get :index, {}, valid_session
      expect(assigns(:attendee)).to eq(attendee)
    end

    it "assigns the room if a room_id cookie is present" do
      request.cookies[:room_id] = room.to_param
      get :index, {}, valid_session
      expect(assigns(:room)).to eq(room)
    end
  end
end
