class Booking < ApplicationRecord
  enum status: [:pending, :accepted, :rejected]
  belongs_to :user
  belongs_to :bike
  validates :end_date, presence: true
  validates :start_date, presence: true

end
