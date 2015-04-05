require 'rails_helper'

RSpec.describe Room, type: :model do
  subject { create(:room) }

  context "#display_name" do
    it "returns the room name" do
      expect(subject.display_name).to eq("Room ##{subject.to_param}")
    end
  end
end
