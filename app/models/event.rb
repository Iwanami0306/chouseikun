class Event < ApplicationRecord
  before_create :generate_token
  
  belongs_to :user
  default_scope -> {order(created_at: :desc)}
  validates :name, presence: true, length: {maximum: 50}
  validates :memo, length: {maximum: 255}
  validates :time, length:  {maximum: 255},presence: true

  def generate_token
    self.id = loop do
      random_token = SecureRandom.uuid
      break random_token unless self.class.exists?(id: random_token)
    end
  end
end
