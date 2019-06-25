class EventDate < ApplicationRecord
  belongs_to :event, foreign_key: 'event_id'
  validates :event_id, presence: true
  validates :choice, presence: true, length: {maximum:15}
  has_many :answers, dependent: :destroy
  default_scope -> {order(created_at: :asc)}
  attr_accessor :count_ng, :count_neither, :count_ok, :rate

  def count_feeling
    self.count_ng = self.answers.where(feeling: "NG").count || 0
    self.count_neither = self.answers.where(feeling: "Neither").count || 0
    self.count_ok = self.answers.where(feeling: "OK").count || 0
    sum = 0
    sum += self.count_ok * 100
    sum += self.count_neither * 50
    all_count = self.count_ng + self.count_neither + self.count_ok
    self.rate = (all_count == 0) ? 0 : sum /all_count
  end

end
