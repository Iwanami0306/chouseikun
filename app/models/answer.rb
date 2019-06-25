class Answer < ApplicationRecord
  enum feeling: { NG: 0, Neither: 1, OK: 2 }

  belongs_to :join
  belongs_to :event_date
  validates :event_date_id, presence: true
  validates :join_id, presence: true
  validates :feeling, presence:true, inclusion: {in: Answer.feelings.keys}
end

