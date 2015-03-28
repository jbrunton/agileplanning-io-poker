class Attendee < ActiveRecord::Base
  belongs_to :room

  validates :name, presence: true
end
