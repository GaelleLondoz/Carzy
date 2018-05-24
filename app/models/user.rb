class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :vehicules
  has_many :bookings

  has_many :bookings_on_vehicules, through: :vehicules, source: :bookings

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true

  def photo_file_name
    self.email
  end
end
