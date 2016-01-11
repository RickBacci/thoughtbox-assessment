Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  resources :users,    only: [:new, :create]
  resources :links,    only: [:index, :create, :edit, :update]

  delete '/logout', to: 'sessions#destroy'

  post '/update-status', to: 'links#update_status'

  root 'links#index'
end
