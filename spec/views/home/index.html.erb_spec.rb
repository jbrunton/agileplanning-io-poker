require 'rails_helper'

RSpec.describe "home/index", type: :view do
  context "if the room_history is set" do
    before(:each) do
      assign(:room_history, [
        create(:attendee, name: 'Alice',
          room: create(:room, name: 'Some Room'))
      ])
    end

    it "lists the room history" do
      render
      expect(rendered).to match /Some Room/
      expect(rendered).to match /as Alice/
    end
  end
end
