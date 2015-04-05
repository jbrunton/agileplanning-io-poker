require 'rails_helper'

RSpec.describe "home/index", type: :view do
  context "if the attendee is set" do
    before(:each) do
      assign(:attendee, create(:attendee, name: 'Alice'))
    end

    it "welcomes the attendee" do
      render
      expect(rendered).to match /Welcome back, Alice!/
    end
  end

  context "if the attendee is not set" do
    it "does not welcome the attendee" do
      render
      expect(rendered).not_to match /Welcome/
    end
  end

  context "if the room is set" do
    before(:each) do
      assign(:room, create(:room))
    end

    it "links to the room" do
      render
      expect(rendered).to match /readminister/
    end
  end

  context "if the room is not set" do
    it "does not link to it" do
      render
      expect(rendered).not_to match /readminister/
    end
  end

end
