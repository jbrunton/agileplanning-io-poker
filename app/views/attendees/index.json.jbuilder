json.array!(@attendees) do |attendee|
  json.extract! attendee, :id, :name, :score, :ready, :room_id
  json.url attendee_url(attendee, format: :json)
end
