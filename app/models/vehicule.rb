class Vehicule < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :brand, presence: true
  validates :model, presence: true
  validates :mileage, presence: true
  validates :price_per_day, presence: true
  validates :transmission, presence: true
  validates :category, presence: true
  mount_uploader :photo, PhotoUploader
end
