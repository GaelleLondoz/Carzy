class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  # before_action :set_vehicule, only: [:home]

  def home
  end

  def profile
    @bookings_i_made = current_user.bookings
    @bookings_on_my_vehicule = current_user.bookings_on_vehicules
    @vehicules = Vehicule.all
  end


  private

  # def set_vehicule
  #   @vehicule = Vehicule.find(params[:id])
  # end
end
