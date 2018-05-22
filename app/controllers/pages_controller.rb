class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  # before_action :set_vehicule, only: [:home]

  def home
  end

  private

  # def set_vehicule
  #   @vehicule = Vehicule.find(params[:id])
  # end
end
