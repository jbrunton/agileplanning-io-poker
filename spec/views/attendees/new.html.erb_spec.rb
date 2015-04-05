require 'rails_helper'

RSpec.describe "attendees/new", type: :view do
  let(:room) { create(:room) }
  let(:attendee) { Attendee.new }

  before(:each) do
    assign(:room, room)
    assign(:attendee, attendee)
    assign(:record, [room, attendee])
  end

  it "sets the title" do
    render
    expect(rendered).to match /Join #{room.display_name}/
  end
end
