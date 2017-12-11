require 'open-uri'

class ActivitiesController < ApplicationController

def show
  @activity = Activity.find(params[:id])
  @step = @activity.step
  authorize @activity
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
  photo = picture_scraper(@activity.url)
  @activity.step = @step
  authorize @activity
  if photo == 0
    @activity.photo = "https://picsum.photos/400/400"
  else
    @activity.photo = photo
  end
  if @activity.save
    redirect_to step_activities_path(@step)
  else
    render :new
  end
end

def edit
  @activity = Activity.find(params[:id])
  @step = @activity.step
  authorize @activity
end

def update
  @activity =Activity.find(params[:id])
  @step = @activity.step
  photo = picture_scraper(@activity.url)
  authorize @activity
  if photo == 0
    @activity.photo = "https://picsum.photos/400/400"
  else
    @activity.photo = photo
  end
  if @activity.update(activity_params)
    redirect_to step_activities_path(@step)
  else
    render :edit
  end
end

def destroy
  @activity = Activity.find(params[:id])
  @step = @activity.step
  @activity.destroy
  redirect_to step_activities_path(@step)
  authorize @activity
end

private

def activity_params
  params.require(:activity).permit(:title, :url)
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
