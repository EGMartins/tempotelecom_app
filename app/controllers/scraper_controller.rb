# ScraperController is a controller that will scrape google search results
class ScraperController < ApplicationController
  def google_search
    results = GoogleScrapService.new.scrap('ruby on rails')
    render json: results
  end
end

