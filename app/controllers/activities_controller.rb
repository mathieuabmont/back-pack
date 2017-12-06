require 'open-uri'

class ActivitiesController < ApplicationController

def show
  @activity = Activity.find(params[:id])
end

def new
  @step = Step.find(params[:step_id])
  @activity = Activity.new
end

def create
  @step = Step.find(params[:step_id])
  @activity = Activity.new(activity_params)
  photo = picture_scraper(@activity.url)
  @activity.step = @step
  if photo
    @activity.photo = photo
  else
    # TO DO HERE => placeholder
  end
  if @activity.save
    redirect_to activity_path(@activity)
  else
    render :new
  end
end

def edit
  @activity = Activity.find(params[:id])
end

def update
  @activity =Activity.find(params[:id])
  photo = picture_scraper(@activity.url)
  if photo
    @activity.photo = photo
  else
    # TO DO HERE => placeholder
  end
  if @activity.update(activity_params)
    redirect_to activity_path(@activity)
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
