class Review < ApplicationRecord
  belongs_to :vehicule
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }, presence: true, numericality: {only_integer: true}
  validates :content, presence: true
end
