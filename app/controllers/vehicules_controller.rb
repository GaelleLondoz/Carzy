class VehiculesController < ApplicationController
  before_action :set_vehicule, only: [:edit, :update, :destroy, :show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    filters = params.permit(:brand, :model, :number_of_seats, :price_per_day, :year, :transmission, :category).to_h.delete_if { |k, v| v.empty? }
    @vehicules = Vehicule.where(filters).where.not(latitude: nil, longitude: nil)

    if params[:location].present?
      @vehicules = @vehicules.near(params[:location], 5)
    end


    @markers = @vehicules.map do |vehicule|
      {
        lat: vehicule.latitude,
        lng: vehicule.longitude
      }
    end
  end

  def show
    @review = Review.new
    # @reviews = Review.paginate(:page => params[:page])
    # Review.paginate(:page => params[:page], :per_page => 3)
    @reviews = Review.order(created_at: :desc).paginate(:per_page => 3, :page => params[:page])
    @markers = [{
      lat: @vehicule.latitude,
      lng: @vehicule.longitude,
    }]
    @booking = Booking.new

    respond_to do |format|
      format.html { render 'vehicules/show' }
      format.js
    end
  end

  def new
    @vehicule = Vehicule.new
  end

  def create
    @vehicule = Vehicule.new(vehicule_params)
    @vehicule.user_id = current_user.id
    if @vehicule.save
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
    redirect_to vehicules_path
  end

  private

  def set_vehicule
    @vehicule = Vehicule.find(params[:id])
  end

  def vehicule_params
    params.require(:vehicule).permit(:brand, :model, :mileage, :price_per_day, :year, :fuel_type, :transmission, :category, :photo, :location, :number_of_seats, :description)
  end
end
