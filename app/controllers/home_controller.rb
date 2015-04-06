class HomeController < ApplicationController
  include HistoryHelper

  def index
    @attendee_history = attendee_history
    @admin_history = admin_history
  end
end