Rails.application.routes.draw do
  root 'api/v1/thoughts#index'

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :thoughts, only: [:index]
    end
  end

end
