class TransportsController < ApplicationController

  def show
    @transport = Transport.find(params[:id])
  end

  def new
    @transport = Transport.new
  end

  def create
    @step = Step.find(params[:step_id])
    @transport = Transport.new(transport_params)
    @transport.step = @step
    # @transport.user = current_user
    # authorize @transport
    if @transport.save
      redirect_to trip_step_transport(@transport)
    else
      render:new
    end
  end

  def edit
    @transport = Transport.find(params[:id])
  end

  def update
    @transport =Transport.find(params[:id])
    if @transport.update(transport_params)
      redirect_to trip_step_transport(@transport)
    else
      render :edit
    end
  end

  def destroy
    @transport = Transport.find(params[:id])
    @transport.destroy
  end

  private

  def transport_params
    params require(:booking).permit(:departure_time, :departure_location, :arrival_time, :arrival_date, :arrival_location)
  end

end
