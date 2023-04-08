require 'rails_helper'

RSpec.describe 'home/index', type: :view do
  it 'renders a list of tasks' do
    render
    assert_select 'h1', text: 'Pratical Test Tempotelecom', count: 1
    assert_select 'h3', text: 'Choose your next action', count: 1
    assert_select 'a', text: 'Tasks', count: 1
    assert_select 'a', text: 'Google Scrapper', count: 1
  end
end
