class Event < ApplicationRecord
  validates :name, presence: true, length: {maximum: 50}
  validates :memo, length: {maximum: 255}
end
