module HistoryHelper
  ATTENDEE_TOKEN_REGEX = /attendee:(\d*)/
  ADMIN_TOKEN_REGEX = /admin:(\d*)/

  def append_history(history_type, attendee)
    room_history = (cookies['room_history'] || '')
    room_history.concat(' ') unless room_history.empty?
    room_history.concat("#{history_type}:#{attendee.id}")
    cookies.permanent['room_history'] = room_history
  end

  def room_history
    tokens = (cookies[:room_history] || '').split
    tokens.map do |token|
      attendee_match = ATTENDEE_TOKEN_REGEX.match(token)
      admin_match = ADMIN_TOKEN_REGEX.match(token)
      if attendee_match
        Attendee.find_by_id(attendee_match[1])
      elsif admin_match
        Room.find_by_id(admin_match[1])
      end
    end
  end
end