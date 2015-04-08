class HomeController < ApplicationController
  include HistoryHelper

  def index
    @attendee_history = attendee_history
    @admin_history = admin_history
  end

  def join
    room = Room.find_by_id(params[:room_id])
    redirect_to(room)
  end
end