require 'rails_helper'

RSpec.describe Room, type: :model do
  describe "#display_name" do
    context "if the room name is given" do
      subject { create(:room, name: 'My Room') }

      it "returns the name" do
        expect(subject.display_name).to eq(subject.name)
      end
    end

    context "otherwise" do
      subject { create(:room, name: '') }

      it "returns the room number" do
        expect(subject.display_name).to eq("Room ##{subject.to_param}")
      end
    end
  end
end
