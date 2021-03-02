Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cars
    end
  end
  resources :rents, only: %i[update destroy]
  resources :users, only: %i[create show index update destroy] do
    resources :rents, only: %i[index create destroy]
  end

  get '/rents', to: 'rents#all'
  post '/login',    to: 'sessions#create'
end
