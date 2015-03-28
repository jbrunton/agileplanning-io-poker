require 'rails_helper'

RSpec.describe "Attendees", type: :request do
  describe "GET /attendees" do
    it "works! (now write some real specs)" do
      get attendees_path
      expect(response).to have_http_status(200)
    end
  end
end
