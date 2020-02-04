Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :show]
  resources :images, only: [:create]
  resources :users, only: [:show]
  
end
