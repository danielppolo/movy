class Bike < ApplicationRecord
  enum status: [:available, :unavailable]
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :booking
  validates :rate, presence: true
  validates :location, presence: true
end
