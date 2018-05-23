class Booking < ApplicationRecord
  belongs_to :vehicule
  belongs_to :user
  validates :check_in, presence: true, timeliness: { on_or_after: lambda { Date.current }, type: :date }
  validates :check_out, presence: true, timeliness: { on_or_after: lambda { self.check_in }, type: :date }
  validates :status, inclusion: { in: ["pending", "accepted", "denied"] }
end
