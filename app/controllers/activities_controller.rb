require 'open-uri'

class ActivitiesController < ApplicationController

  before_action :set_step, only: [:new, :create, :edit, :update, :show]

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    photo = picture_scraper(@activity.url)
    @activity.step = @step
    if photo
      @activity.photo = photo
    else
      @activity.photo = "https://picsum.photos/400/400"
    end
    if @activity.save
      redirect_to step_activity_path(@step, @activity)
    else
      render :1 new
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity =Activity.find(params[:id])
    photo = picture_scraper(@activity.url)
    @activity.step = @step
    if photo
      @activity.photo = photo
    else
      @activity.photo = "https://picsum.photos/400/400"
    end

    if @activity.update(activity_params)
      redirect_to step_activity_path(@step, @activity)
    else
      render :edit
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :url)
  end

  def set_step
    @step = Step.find(params[:step_id])
  end

  def picture_scraper(url)
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    html_doc.search('meta').each do |element|
      if element.attribute('property')
        if element.attribute('property').value == "og:image"
          image_url = element.attribute('content').value
          return image_url
        end
      end
    end
  end

end
