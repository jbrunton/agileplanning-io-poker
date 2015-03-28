class Room < ActiveRecord::Base
  has_many :attendees
end
