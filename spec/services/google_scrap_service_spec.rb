require 'rails_helper'

RSpec.describe GoogleScrapService do
  subject { described_class.new.scrap('test') }
  let(:scrapper_results) { ScrapperResult.all }
  let(:scrapper_result) { scrapper_results.first }

  describe '#scrap' do
    before do
      VCR.use_cassette('google_scrap_service') do
        subject
      end
    end

    it 'scrap 20 results' do
      expect(scrapper_results.size).to eq 20
    end

    it 'scrap title' do
      expect(scrapper_result.title).to eq 'Speed Test'
    end

    it 'scrap link' do
      expect(scrapper_result.link).to eq 'https://www.speedtest.net/pt'
    end

    it 'scrap date' do
      expect(scrapper_result.date).to be_empty
    end
  end
end
