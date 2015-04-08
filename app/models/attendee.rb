class Attendee < ActiveRecord::Base
  belongs_to :room

  validates :name, presence: true
  validates :room, presence: true

  default_scope { order(created_at: :asc) }
end
