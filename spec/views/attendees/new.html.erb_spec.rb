require 'rails_helper'

RSpec.describe "attendees/new", type: :view do
  before(:each) do
    assign(:attendee, Attendee.new(
      :name => "MyString",
      :score => "MyString",
      :ready => false,
      :room => nil
    ))
  end

  it "renders new attendee form" do
    render

    assert_select "form[action=?][method=?]", attendees_path, "post" do

      assert_select "input#attendee_name[name=?]", "attendee[name]"

      assert_select "input#attendee_score[name=?]", "attendee[score]"

      assert_select "input#attendee_ready[name=?]", "attendee[ready]"

      assert_select "input#attendee_room_id[name=?]", "attendee[room_id]"
    end
  end
end
