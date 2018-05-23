class AddCoordinatesToVehicules < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicules, :latitude, :float
    add_column :vehicules, :longitude, :float
  end
end
