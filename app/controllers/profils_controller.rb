class ProfilsController < ApplicationController

  def show
    @profil = User.find(params[:id])
    @trips = Trip.all

  end


end
