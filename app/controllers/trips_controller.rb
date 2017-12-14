class TripsController < ApplicationController
  def index

    @invitations = Invitation.where(email: current_user.email, status: "pending")
    @trips = policy_scope(Trip).includes(:itineraries).where(itineraries: {user_id: current_user.id})
   end

  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
    trips = Trip.all
    @trip = Trip.new(trip_params)
    authorize @trip
    @trip.photo = "https://kitt.lewagon.com/placeholder/cities/#{@trip.title}"
    if @trip.save
      Itinerary.create(user: current_user, trip: @trip)
      redirect_to new_trip_step_path(@trip)
    else
      render :new
    end
  end

  def join
    @trip = Trip.find(params[:id])
    @invitation = Invitation.find(params[:invitation])
    authorize @invitation
    @invitation.status = 'accepted'
    @invitation.save
    Itinerary.create(user: current_user, trip: @trip)
    redirect_to trips_path

  end

  def edit
    @trip = Trip.find(params[:id])
    authorize @trip
  end

  def update
    @trip = Trip.find(params[:id])
    authorize @trip
    @trip.update(trip_params)
    redirect_to trips_path
  end

  def destroy
    @trip = Trip.find(params[:id])
    authorize @trip
    @trip.destroy
    redirect_to trips_path
  end



  private

  def trip_params
    params.require(:trip).permit(:title)
  end
end
