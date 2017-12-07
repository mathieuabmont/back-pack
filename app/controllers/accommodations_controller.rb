require 'open-uri'

class AccommodationsController < ApplicationController

  def show
    @accommodation = Accommodation.find(params[:id])
    @step = @accommodation.step
  end

  def new
    @step = Step.find(params[:step_id])
    @accommodation = Accommodation.new
  end

  def create
    @step = Step.find(params[:step_id])
    @accommodation = Accommodation.new(accommodation_params)
    photo = picture_scraper(@accommodation.url)
    if photo
      @accommodation.photo = photo
    else
      @accommodation.photo = "https://picsum.photos/400/400"
    end
    @accommodation.step = @step
    if @accommodation.save
      redirect_to accommodation_path(@accommodation)
    else
      render :new
    end
  end

  def edit
    @accommodation = Accommodation.find(params[:id])
    @step = @accommodation.step
  end

  def update
    @accommodation = Accommodation.find(params[:id])
    @step = @accommodation.step
    photo = picture_scraper(@accommodation.url)
    if photo
      @accommodation.photo = photo
    else
      @accommodation.photo = "https://picsum.photos/400/400"
    end
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
    params.require(:accommodation).permit(:category, :name, :url, :location, :arrival_date, :departure_date)
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
