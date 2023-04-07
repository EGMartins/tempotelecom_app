require 'rails_helper'

RSpec.describe 'scrapper/index', type: :view do
  before(:each) do
    assign(:scrap_results, [
             ScrapperResult.create!(
               { title: 'Test 1',
                 link: 'www.test.com',
                 date: '2021-10-01' }
             ),
             ScrapperResult.create!(
               { title: 'Test 2',
                 link: 'www.test2.com',
                 date: '2021-10-15' }
             )
           ])
  end

  it 'renders a list of results' do
    render
    assert_select 'tr>td', text: 'Test 1'.to_s, count: 1
    assert_select 'tr>td', text: 'Test 2'.to_s, count: 1
    assert_select 'tr>td', text: 'www.test.com'.to_s, count: 1
    assert_select 'tr>td', text: 'www.test2.com'.to_s, count: 1
  end
end
