class StepsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @steps = Step.where(trip: @trip)
    @trips = policy_scope(Trip)
    @itinerary = @trip.itineraries.where(user_id: current_user.id).first
    @invitation = Invitation.new
   end

  def new
    @trip = Trip.find(params[:trip_id])
    @step = Step.new
    authorize @step
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @step = Step.new(step_params)
    @step.photo = "https://kitt.lewagon.com/placeholder/cities/#{@step.title}"
    @step.trip = @trip
    authorize @step

    if @step.save
      redirect_to new_step_transport_path(@step)
    else
      render :new
    end
  end

  def edit
    @step = Step.find(params[:id])
    authorize @step
  end

  def update
    @step = Step.find(params[:id])
    authorize @step
    @step.update(step_params)
    @trip = @step.trip
    redirect_to trip_steps_path(@trip)
  end

  def destroy
    @step = Step.find(params[:id])
    authorize @step

    @step.destroy
    @trip = @step.trip
    redirect_to trip_steps_path(@trip)
  end

  private

  def step_params
    params.require(:step).permit(:title)
  end
end
