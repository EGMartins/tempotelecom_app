Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks do
    get 'create_random_task', on: :collection
  end
  get 'scraper/google_search'
  get 'scrapper', to: 'scraper#index'
  get 'scrapper/remove_all', to: 'scraper#remove_all'
end
