class InvitationsController < ApplicationController

  def create
    @trip = Trip.find(params[:trip_id])
    @invitation = Invitation.new(invitation_params)
    @invitation.trip = @trip
    @invitation.code = "#{@trip.title}"
    @invitation.status = "pending"


    if @invitation.save
      UserMailer.invite(@invitation).deliver_now
      redirect_to trip_steps_path(@trip)
    else
      render :new
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email)
  end
end

