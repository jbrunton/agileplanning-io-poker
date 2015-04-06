module WebsocketHelper
  def notify_attendee_update(attendee)
    WebsocketRails["room:#{attendee.room.id}"].trigger(:updated, { attendee_id: attendee.id })
  end

  def notify_room_update(room)
    WebsocketRails["room:#{room.id}"].trigger(:updated)
  end
end