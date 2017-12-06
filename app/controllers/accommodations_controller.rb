class AccommodationsController < ApplicationController
  def show
    @accommodation = Accommodation.find(params[:id])
  end

  def new
    @step = Step.find(params[:step_id])
    @accommodation = Accommodation.new
  end

  def create
    @step = Step.find(params[:step_id])
    @accommodation = Accommodation.new(accommodation_params)
    @accommodation.step = @step
    if @accommodation.save
      redirect_to accommodation_path(@accommodation)
    else
      render :new
    end
  end

  def edit
    @accommodation = Accommodation.find(params[:id])
  end

  def update
    @accommodation = Accommodation.find(params[:id])
    if @accommodation.update(accommodation_params)
      redirect_to accommodation_path(@accommodation)
    else
      render :edit
    end
  end

  def destroy
    @accommodation = Accommodation.find(params[:id])
    @accommodation.destroy
  end

  private

  def accommodation_params
    params require(:booking).permit(:category, :name, :url, :location, :arrival_date, :departure_date)
  end
end
