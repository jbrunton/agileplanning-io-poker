require 'rails_helper'

RSpec.describe RoomsHelper, type: :helper do
  let(:attendee) { create(:attendee) }

  describe "#append_history" do
    context "if the room_history cookie is nil" do
      before(:each) do
        helper.cookies['room_history'] = nil
      end

      it "sets the history" do
        helper.append_history(attendee)
        expect(helper.cookies['room_history']).to eq("attendee:#{attendee.id}")
      end
    end

    context "if the room_history cookie is set" do
      before(:each) do
        helper.cookies['room_history'] = "attendee:123"
      end

      it "appends the history" do
        helper.append_history(attendee)
        expect(helper.cookies['room_history']).to eq("attendee:123 attendee:#{attendee.id}")
      end
    end
  end

  describe "#room_history" do
    it "returns the list of recent attendees" do
      helper.cookies['room_history'] = "attendee:#{attendee.id}"
      expect(helper.room_history).to eq([attendee])
    end
  end
end