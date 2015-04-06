require 'rails_helper'

RSpec.describe "home/index", type: :view do
  context "if the room_history is set" do
    let(:administered_room) { create(:room, name: 'Administered Room') }
    let(:attended_room) { create(:room, name: 'Attended Room') }
    let(:attendee) { create(:attendee, name: 'Some Attendee', room: attended_room) }

    before(:each) do
      assign(:room_history, [attendee, administered_room])
    end

    it "lists the room history" do
      render
      expect(rendered).to match /Attended Room/
      expect(rendered).to match /as Some Attendee/

      expect(rendered).to match /Administered Room/
      expect(rendered).to match /\(admin\)/
    end
  end
end
