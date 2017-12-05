class ActivitiesController < ApplicationController

def show
end

def new
end

def create
  @activity = Activity.new(activity_params)
  photo = picture_scraper(@activity.url)
  if photo
    @activity.photo = photo
  else
    # TO DO HERE => placeholder
  end
end

def edit
end

def update
end

def destroy
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
