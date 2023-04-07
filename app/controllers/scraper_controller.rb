# ScraperController is a controller that will scrape google search results
class ScraperController < ApplicationController
  def google_search
    results = GoogleScrapService.new.scrap('tempotelecom')
    render json: results
  end
end

