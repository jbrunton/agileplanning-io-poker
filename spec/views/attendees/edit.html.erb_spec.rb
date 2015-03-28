require 'rails_helper'

RSpec.describe "attendees/edit", type: :view do
  before(:each) do
    @attendee = assign(:attendee, Attendee.create!(
      :name => "MyString",
      :score => "MyString",
      :ready => false,
      :room => nil
    ))
  end

  it "renders the edit attendee form" do
    render

    assert_select "form[action=?][method=?]", attendee_path(@attendee), "post" do

      assert_select "input#attendee_name[name=?]", "attendee[name]"

      assert_select "input#attendee_score[name=?]", "attendee[score]"

      assert_select "input#attendee_ready[name=?]", "attendee[ready]"

      assert_select "input#attendee_room_id[name=?]", "attendee[room_id]"
    end
  end
end
