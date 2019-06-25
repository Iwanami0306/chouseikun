class Join < ApplicationRecord
  belongs_to :event, foreign_key: 'event_id'
  validates :event_id, presence: true
  validates :name, presence: true, length: {maximum: 50}
  has_many :answers, dependent: :destroy

  private
end
