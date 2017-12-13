# require 'open-uri'

class ActivitiesController < ApplicationController

def show
  @activity = Activity.find(params[:id])
  authorize @activity
  @step = @activity.step
end

def index
  @step = Step.find(params[:step_id])
  @activities = policy_scope(Activity).where(step: @step)
end

def new
  @step = Step.find(params[:step_id])
  @activity = Activity.new(step: @step)
  authorize @activity
end

def create
  @step = Step.find(params[:step_id])
  @activity = Activity.new(activity_params)
  if @activity.url == ""
    @activity.url = "https://picsum.photos/400/400"
  end
  photo = picture_scraper(@activity.url)
  @activity.photo = photo
  @activity.step = @step
  authorize @activity
  if @activity.save
    redirect_to step_activities_path(@step)
  else
    render :new
  end
end

def edit
  @activity = Activity.find(params[:id])
  authorize @activity
  @step = @activity.step
end

def update
  @activity =Activity.find(params[:id])
  if @activity.url == ""
    @activity.url = "https://picsum.photos/400/400"
  end
  photo = picture_scraper(@activity.url)
  @activity.photo = photo
  @step = @activity.step
  authorize @activity
  if @activity.update(activity_params)
    redirect_to step_activities_path(@step)
  else
    render :edit
  end
end

def destroy
  @activity = Activity.find(params[:id])
  @step = @activity.step
  authorize @activity
  @activity.destroy
  redirect_to step_activities_path(@step)
end

private

def activity_params
  params.require(:activity).permit(:title, :url)
end

def picture_scraper(url)
  response = RestClient.get(url)
  html_doc = Nokogiri::HTML(response.body)
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
