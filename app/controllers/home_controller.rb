class HomeController < ApplicationController
  def index
    @room_history = (cookies[:room_history] || "").
        split.
        map{ |token| Attendee.find_by_id(/attendee:(\d*)/.match(token)[1]) }

    #@attendee = Attendee.find_by_id(cookies[:attendee_id])
    #@room = Room.find_by_id(cookies[:room_id])
  end
end