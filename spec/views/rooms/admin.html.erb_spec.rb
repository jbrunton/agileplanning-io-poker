require 'rails_helper'

RSpec.describe "rooms/admin", type: :view do
  let(:room) { create(:room) }

  before(:each) do
    assign(:room, room)
  end

  it "sets the title" do
    render
    expect(rendered).to match /#{room.display_name}/
  end
end
