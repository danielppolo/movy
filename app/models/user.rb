class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_many :bikes, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one :profile, dependent: :destroy
end
