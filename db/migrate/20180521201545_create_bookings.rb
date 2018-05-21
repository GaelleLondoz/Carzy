class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :check_in
      t.date :check_out
      t.references :vehicule, foreign_key: true
      t.references :user, foreign_key: true
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
