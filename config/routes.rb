Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :forecast, only: [:index]
      resources :backgrounds, only: [:index]
      resources :gifs, only: [:index]
      resources :users, only: [:create]
      resources :sessions, only: [:create]
      resources :favorites, only: [:create, :index]
      delete 'favorites', to: 'favorites#destroy'
    end
  end
end
