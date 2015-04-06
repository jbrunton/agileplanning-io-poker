module HistoryHelper
  ATTENDEE_TOKEN_REGEX = /attendee:(\d*)/
  ADMIN_TOKEN_REGEX = /admin:(\d*)/

  def append_attendee_history(attendee)
    append_history(:attendee, attendee)
  end

  def append_admin_history(attendee)
    append_history(:admin, attendee)
  end

  def attendee_history
    tokens = (cookies[:attendee_history] || '').split
    tokens.map do |token|
      Attendee.find_by_id(ATTENDEE_TOKEN_REGEX.match(token)[1])
    end
  end

  def admin_history
    tokens = (cookies[:admin_history] || '').split
    tokens.map do |token|
      Room.find_by_id(ADMIN_TOKEN_REGEX.match(token)[1])
    end
  end

private
  def append_history(history_type, record)
    cookie_name = "#{history_type}_history"

    history = (cookies[cookie_name] || '')
    history.concat(' ') unless history.empty?
    history.concat("#{history_type}:#{record.id}")

    cookies.permanent[cookie_name] = history
  end
end