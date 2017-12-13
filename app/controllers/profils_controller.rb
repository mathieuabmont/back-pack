class ProfilsController < ApplicationController

  def show
    @profil = User.find(params[:id])
    @trips = Trip.includes(:itineraries).where(itineraries: {user_id: current_user.id})
  end



end
