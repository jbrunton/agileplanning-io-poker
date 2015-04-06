require 'rails_helper'

RSpec.describe "home/index", type: :view do
  context "if the attendee_history is set" do
    let(:attended_room) { create(:room, name: 'Attended Room') }
    let(:attendee) { create(:attendee, name: 'Some Attendee', room: attended_room) }

    before(:each) do
      assign(:attendee_history, [attendee])
    end

    it "lists the attendee history" do
      render
      expect(rendered).to match /Attended Room/
      expect(rendered).to match /as Some Attendee/
    end
  end
end
