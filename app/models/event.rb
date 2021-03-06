class Event < ApplicationRecord
  before_create :generate_token
  after_create  :build_event_dates_from_time
  belongs_to :user
  default_scope -> {order(created_at: :desc)}
  validates :id, uniqueness: true
  validates :name, presence: true, length: {maximum: 50}
  validates :memo, length: {maximum: 255}
  validates :time, length:  {maximum: 255}, presence: true

  has_many :event_dates, foreign_key: :event_id, dependent: :destroy
  has_many :joins, foreign_key: :event_id, dependent: :destroy

  def generate_token
    self.uuid = loop do
      random_token = SecureRandom.uuid
      break random_token unless self.class.exists?(uuid: random_token)
    end
  end

  def build_event_dates_from_time
    if self.time
      time.each_line do |line|
        EventDate.create(choice: line.strip,event_id:self.id)
      end
    end
  end
end
