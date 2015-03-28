FactoryGirl.define do
  factory :attendee do
    sequence(:name) { |k| "Attendee #{k}" }
    room
  end
end
