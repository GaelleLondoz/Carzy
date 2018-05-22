class CreateVehicules < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicules do |t|
      t.string :brand
      t.string :model
      t.string :mileage
      t.string :price_per_day
      t.string :year
      t.string :fuel_type
      t.string :transmission
      t.string :category
      t.string :photo
      t.string :location
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
