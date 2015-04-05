class HomeController < ApplicationController
  def index
    @attendee = Attendee.find_by_id(cookies[:attendee_id])
    @room = Room.find_by_id(cookies[:room_id])
  end
end