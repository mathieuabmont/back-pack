class StepsController < ApplicationController
  def index
    @steps = Step.all
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @step = Step.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @step = Step.new(step_params)
    @step.user = current_user
    if @step.save
      redirect_to steps_path
    else
      render :new
    end
  end

  def edit
    @step = Step.find(params[:id])
  end

  def update
    @step = Step.find(params[:id])
    @step.update(params[:step])
  end

  def destroy
    @step = Step.find(params[:id])
    @step.destroy
    redirect_to steps_path
  end

  private

  def step_params
    params.require(:step).permit(:title)
  end
end
