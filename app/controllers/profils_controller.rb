class ProfilsController < ApplicationController

  def show
    @profil = User.find(params[:id])
  end
end
