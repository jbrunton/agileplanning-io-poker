module RoomsHelper
  def notify_update(room)
    WebsocketRails["room:#{room.id}"].trigger(:updated)
  end
end
