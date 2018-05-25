class Vehicule < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :bookings
  validates :brand, presence: true
  validates :model, presence: true
  validates :mileage, presence: true
  validates :price_per_day, presence: true
  validates :transmission, presence: true
  validates :category, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def photo_file_name
    self.brand
  end
end
