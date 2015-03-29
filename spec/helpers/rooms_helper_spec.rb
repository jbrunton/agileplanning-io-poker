require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the RoomsHelper. For example:
#
# describe RoomsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe RoomsHelper, type: :helper do
  describe "#list_names" do
    context "if the room is empty" do
      before(:each) {
        assign(:room, create(:room))
      }

      it "returns 'This room is empty'" do
        expect(helper.list_names).to eq('This room is empty')
      end
    end

    context "if the room has one attendee" do
      before(:each) {
        assign(:room, create(:room, attendees: [
          create(:attendee, name: 'John')
        ]))
      }

      it "returns the name" do
        expect(helper.list_names).to eq('John')
      end
    end

    context "if the room has multiple attendees" do
      before(:each) {
        assign(:room, create(:room, attendees: [
          create(:attendee, name: 'John'),
          create(:attendee, name: 'Jeff'),
          create(:attendee, name: 'James')
        ]))
      }

      it "returns a comma separated list of names" do
        expect(helper.list_names).to eq('Jeff, James and John')
      end
    end
  end
end
