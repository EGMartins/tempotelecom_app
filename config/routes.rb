Rails.application.routes.draw do
  root 'home#index'

  resources :tasks do
    get 'create_random_task', on: :collection
  end
  get 'scrapper/google_search'
  get 'scrapper', to: 'scrapper#index'
  get 'scrapper/remove_all'
end
