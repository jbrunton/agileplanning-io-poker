module RoomsHelper
  def notify_update(attendee)
    WebsocketRails["room:#{attendee.room.id}"].trigger(:updated, { attendee_id: attendee.id })
  end

  def list_names
    if @room.attendees.empty?
      'This room is empty'
    else
      first_name, *other_names = @room.attendees.map{ |attendee| attendee.name }
      return first_name if other_names.empty?
      return "#{other_names.join(', ')} and #{first_name}"
    end
  end
end
