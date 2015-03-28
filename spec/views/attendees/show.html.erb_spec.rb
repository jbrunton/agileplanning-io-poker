require 'rails_helper'

RSpec.describe "attendees/show", type: :view do
  before(:each) do
    @attendee = assign(:attendee, Attendee.create!(
      :name => "Name",
      :score => "Score",
      :ready => false,
      :room => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Score/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
