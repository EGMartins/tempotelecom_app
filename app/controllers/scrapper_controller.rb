# frozen_string_literal: true

# ScraperController is a controller that will scrape google search results
class ScrapperController < ApplicationController
  def index
    @scrap_results = ScrapperResult.all
  end

  def remove_all
    ScrapperResult.destroy_all
    redirect_to scrapper_path, notice: t('scrapper.index.removed')
  end

  def google_search
    ScrapGoogleResultJob.perform_later
    respond_to do |format|
      format.html do
        redirect_to scrapper_path, notice: t('scrapper.index.scrapped')
      end
    end
  end
end
