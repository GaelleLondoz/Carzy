class BookingsController < ApplicationController
  def new
    @booking = Booking.new(booking_params)
    @vehicule = Vehicule.find(params[:vehicule_id])
  end

  def create
    @vehicule = Vehicule.find(params[:vehicule_id])
    @booking = Booking.new(booking_params)
    @booking.vehicule_id = @vehicule.id
    @booking.user = current_user

    if @booking.save
      flash[:notice] = "Booking request sent to #{@vehicule.user.first_name.capitalize}"
      redirect_to vehicule_path(@vehicule)
    else
      flash[:alert] = "Please choose correct check-in and check-out date"
      render :new
    end
  end

  def update
    @booking.status = "accepted"
    redirect_to profile_path
  end

  def destroy
    @booking.destroy
    redirect_to profile_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :status, :user_id, :vehicule_id)
  end
end
