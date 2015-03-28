require 'rails_helper'

RSpec.describe "attendees/index", type: :view do
  before(:each) do
    assign(:attendees, [
      Attendee.create!(
        :name => "Name",
        :score => "Score",
        :ready => false,
        :room => nil
      ),
      Attendee.create!(
        :name => "Name",
        :score => "Score",
        :ready => false,
        :room => nil
      )
    ])
  end

  it "renders a list of attendees" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Score".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
