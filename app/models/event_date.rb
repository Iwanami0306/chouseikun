class EventDate < ApplicationRecord
  belongs_to :event
  validates :user_id, presence: true
  validates :time, presence: true, length: {maximum: 20}
end
