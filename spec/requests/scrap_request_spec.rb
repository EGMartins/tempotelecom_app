require 'rails_helper'

RSpec.describe ScrapperController, type: :request do
  describe 'GET #index' do
    it 'returns http success' do
      get '/scrapper'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #remove_all' do
    before { ScrapperResult.create(title: 'Test scrap', link: 'www.test@test.com', date: 'March 22, 2023') }

    it 'returns http found' do
      get '/scrapper/remove_all'
      expect(response).to have_http_status(:found)
    end

    it 'clear scrapper result database' do
      expect(ScrapperResult.all.size).to be_positive
      get '/scrapper/remove_all'
      expect(ScrapperResult.all.size).to be_zero
    end
  end
end
