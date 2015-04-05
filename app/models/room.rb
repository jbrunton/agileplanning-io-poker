class Room < ActiveRecord::Base
  has_many :attendees

  def display_name
    "Room ##{to_param}"
  end
end
