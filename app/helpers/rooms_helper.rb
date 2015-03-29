module RoomsHelper
  def notify_update(attendee)
    WebsocketRails["room:#{attendee.room.id}"].trigger(:updated, { attendee_id: attendee.id })
  end
end
