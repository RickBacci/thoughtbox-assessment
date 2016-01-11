Rails.application.routes.draw do


  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create]

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :links, only: [:index]
    end
  end

  delete '/logout', to: 'sessions#destroy'

  root 'api/v1/links#index'
end
