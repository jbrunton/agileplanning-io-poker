module HistoryHelper
  TOKEN_REGEX = /attendee:(\d*)/

  def append_history(attendee)
    room_history = (cookies['room_history'] || '')
    room_history.concat(' ') unless room_history.empty?
    room_history.concat("attendee:#{attendee.id}")
    cookies['room_history'] = room_history
  end

  def room_history
    tokens = (cookies[:room_history] || '').split
    tokens.map do |token|
      Attendee.find_by_id(TOKEN_REGEX.match(token)[1])
    end
  end
end