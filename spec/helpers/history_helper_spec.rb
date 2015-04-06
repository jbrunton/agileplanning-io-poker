require 'rails_helper'

RSpec.describe RoomsHelper, type: :helper do
  let(:attendee) { create(:attendee) }
  let(:room) { create(:room) }

  describe "#append_attendee_history" do
    it "sets the history if the cookie is nil" do
      helper.append_attendee_history(attendee)
      expect(helper.cookies['attendee_history']).to eq("attendee:#{attendee.id}")
    end

    it "appends the history if the cookie is set" do
      helper.cookies['attendee_history'] = "attendee:123"
      helper.append_attendee_history(attendee)
      expect(helper.cookies['attendee_history']).to eq("attendee:123 attendee:#{attendee.id}")
    end

    it "appends the history only if the id is unique" do
      helper.cookies['attendee_history'] = "attendee:#{attendee.id}"
      helper.append_attendee_history(attendee)
      expect(helper.cookies['attendee_history']).to eq("attendee:#{attendee.id}")
    end
  end

  describe "#append_admin_history" do
    it "sets the history if the cookie is nil" do
      helper.append_admin_history(room)
      expect(helper.cookies['admin_history']).to eq("admin:#{room.id}")
    end

    it "appends the history if the cookie is set" do
      helper.cookies['admin_history'] = "admin:123"
      helper.append_admin_history(room)
      expect(helper.cookies['admin_history']).to eq("admin:123 admin:#{room.id}")
    end
  end

  describe "#attendee_history" do
    it "returns the list of recent attendees" do
      helper.cookies['attendee_history'] = "attendee:#{attendee.id}"
      expect(helper.attendee_history).to eq([attendee])
    end
  end

  describe "#admin_history" do
    it "returns the list of recent rooms" do
      helper.cookies['admin_history'] = "admin:#{room.id}"
      expect(helper.admin_history).to eq([room])
    end
  end
end