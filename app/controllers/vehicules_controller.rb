class VehiculesController < ApplicationController
  before_action :set_vehicule, only: [:edit, :update, :destroy, :show]
  skip_before_action :authenticate_user!, only: :show
  def show

  end

  def new
    @vehicule = Vehicule.new
  end

  def create
    @vehicule = Vehicule.new(vehicule_params)
    @vehicule.user_id = current_user.id
    if @vehicule.save!
      redirect_to vehicule_path(@vehicule)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @vehicule.update(vehicule_params)
    redirect_to vehicule_path(@vehicule)
  end

  def destroy
    @vehicule.destroy
  end

  private

  def set_vehicule
    @vehicule = Vehicule.find(params[:id])
  end

  def vehicule_params
    params.require(:vehicule).permit(:brand, :model, :mileage, :price_per_day, :year, :fuel_type, :transmission, :category, :photo, :location)
  end
end
