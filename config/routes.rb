Rails.application.routes.draw do

  resources :users, only: [:new, :create]

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :thoughts, only: [:index]
    end
  end

  root 'api/v1/thoughts#index'
end
