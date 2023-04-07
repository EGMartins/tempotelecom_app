# frozen_string_literal: true

# ScraperController is a controller that will scrape google search results
class ScraperController < ApplicationController
  def index
    @scrap_results = ScrapperResult.all
  end

  def remove_all
    ScrapperResult.destroy_all
    redirect_to scrapper_path, notice: 'All results have been removed.'
  end

  def google_search
    ScrapGoogleResultJob.perform_later
    respond_to do |format|
      format.html do
        redirect_to scrapper_path, notice: 'The results are being scrapped on background. \
        Refresh the page after few seconds.'
      end
    end
  end
end
