Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cars
    end
  end
  resources :users, only: %i[create show index update destroy] do
    resources :rents, only: %i[index create]
  end
  post '/login',    to: 'sessions#create'
  post '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
end
