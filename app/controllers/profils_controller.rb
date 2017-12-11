class ProfilsController < ApplicationController

  def show
    @profil = User.find(params[:id])
    @trips = Trip.all
    authorize @profil
  end

end
