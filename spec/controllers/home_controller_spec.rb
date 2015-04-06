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
end
