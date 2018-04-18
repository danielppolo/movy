class Bike < ApplicationRecord
  enum status: [:available, :unavailable]
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :booking
  validates :rate, presence: true
  validates :location, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
