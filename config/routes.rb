Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks do
    get 'create_random_task', on: :collection
  end
  get 'scraper/google_search'
end
