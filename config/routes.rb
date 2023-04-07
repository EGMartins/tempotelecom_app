Rails.application.routes.draw do
  resources :tasks do
    get 'create_random_task', on: :collection
  end
end
