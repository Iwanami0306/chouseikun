class EventDate < ApplicationRecord
  belongs_to :event, foreign_key: 'event_id'
  validates :event_id, presence: true
  validates :choice, presence: true, length: {maximum:15}
end
