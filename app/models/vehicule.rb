class Vehicule < ApplicationRecord
  belongs_to :user
  validates :brand, presence: true
  validates :model, presence: true
  validates :mileage, presence: true
  validates :price_per_day, presence: true
  validates :transmission, presence: true
  validates :category, presence: true
end
