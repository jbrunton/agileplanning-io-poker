class Room < ActiveRecord::Base
  has_many :attendees

  def display_name
    name.blank? ? "Room ##{to_param}" : name
  end
end
