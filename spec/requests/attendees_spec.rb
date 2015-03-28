require 'rails_helper'

RSpec.describe "Attendees", type: :request do
  let(:room) { Room.create! }

  describe "GET /attendees" do
    it "works! (now write some real specs)" do
      get room_attendees_path(room)
      expect(response).to have_http_status(200)
    end
  end
end
