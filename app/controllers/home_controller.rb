class HomeController < ApplicationController
  include HistoryHelper

  def index
    @attendee_history = attendee_history
  end
end