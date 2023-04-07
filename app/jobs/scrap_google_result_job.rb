class ScrapGoogleResultJob < ActiveJob::Base
  queue_as :default

  def perform(*)
    GoogleScrapService.new.scrap('tempotelecom')
  end
end
