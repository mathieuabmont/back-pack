# require 'open-uri'

class AccommodationsController < ApplicationController

  def show
    @accommodation = Accommodation.find(params[:id])
    authorize @accommodation
    @step = @accommodation.step
  end

  def new
    @step = Step.find(params[:step_id])
    @accommodation = Accommodation.new(step: @step)
    authorize @accommodation
  end

  def create
    @step = Step.find(params[:step_id])
    @accommodation = Accommodation.new(accommodation_params)
    if @accommodation.url == ""
      @accommodation.url = "https://picsum.photos/400/400"
    end
    photo = picture_scraper(@accommodation.url)

    @accommodation.step = @step
    @accommodation.photo = photo
    authorize @accommodation
    if @accommodation.save
      redirect_to accommodation_path(@accommodation)
    else
      render :new
    end
  end

  def edit
    @accommodation = Accommodation.find(params[:id])
    authorize @accommodation
    @step = @accommodation.step
  end

  def update
    @accommodation = Accommodation.find(params[:id])
    @step = @accommodation.step
    if @accommodation.url == ""
      @accommodation.url = "https://picsum.photos/400/400"
    end
    photo = picture_scraper(@accommodation.url)
    @accommodation.photo = photo
    authorize @accommodation
    if @accommodation.update(accommodation_params)
      redirect_to accommodation_path(@accommodation)
    else
      render :edit
    end
  end

  def destroy
    @accommodation = Accommodation.find(params[:id])
    authorize @accommodation
    @accommodation.destroy
  end

  private

  def accommodation_params
    params.require(:accommodation).permit(:category, :name, :url, :location, :arrival_date, :departure_date, :description)
  end

  def picture_scraper(url)
    begin
      response = RestClient.get(url)
    rescue RestClient::Forbidden || SocketError
      response = RestClient.get("https://www.airbnb.fr/rooms/3406062?location=atacama&s=9VUdBg8S")
    end
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
