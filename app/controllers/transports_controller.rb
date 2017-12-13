class TransportsController < ApplicationController

  def show
    @transport = Transport.find(params[:id])
    @step = @transport.step
    authorize @transport
    @ticket = @transport.ticket
  end

  def new
    @step = Step.find(params[:step_id])
    @transport = Transport.new(step: @step)
    authorize @transport
  end

  def create
    @step = Step.find(params[:step_id])
    @transport = Transport.new(transport_params)
    @transport.step = @step
    authorize @transport
    if @transport.save
      redirect_to new_step_accommodation_path(@step)
    else
      render :new
    end
  end

  def edit
    @transport = Transport.find(params[:id])
    @step = @transport.step
    authorize @transport
  end

  def update
    @transport =Transport.find(params[:id])
    @step = @transport.step
    authorize @transport
    if @transport.update(transport_params)
      redirect_to transport_path(@transport)
    else
      render :edit
    end
  end

  def destroy
    @transport = Transport.find(params[:id])
    authorize @transport
    @transport.destroy
  end

  private

  def transport_params
    params.require(:transport).permit(:departure_time, :departure_date, :departure_location, :arrival_time, :arrival_date, :arrival_location)
  end

end
