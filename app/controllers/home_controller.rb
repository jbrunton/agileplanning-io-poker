class HomeController < ApplicationController
  include HistoryHelper
  
  def index
    @room_history = room_history
  end
end