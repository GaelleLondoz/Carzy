class VehiculesController < ApplicationController

  def index
    @vehicules = Vehicule.all
  end

  private

  def vehicule_params
    params.require(:vehicule).permit(:location, :brand, :model, :mileage, :price_per_day, :transmission, :category)
  end

  def set_vehicule
    @vehicule = Vehicule.find(params[:id])
  end
end
