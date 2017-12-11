class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    trips = Trip.all
    @trip = Trip.new(trip_params)
    @trip.photo = "https://kitt.lewagon.com/placeholder/cities/#{@trip.title}"
    if @trip.save
      Itinerary.create(user: current_user, trip: @trip)
      redirect_to new_trip_step_path(@trip)
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    redirect_to trips_path

  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:title)
  end
end
