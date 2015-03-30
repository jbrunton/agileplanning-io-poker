class HomeController < ApplicationController
  def index
    @attendee = Attendee.find_by_id(cookies[:attendee_id])
  end
end