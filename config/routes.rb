Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  resources :users,    only: [:new, :create]
  resources :links,    only: [:index, :create]

  delete '/logout', to: 'sessions#destroy'

  root 'links#index'
end
