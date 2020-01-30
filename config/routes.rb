Rails.application.routes.draw do
  # root to: 'items#index'
  resources :items, only: [:index, :new, :create]
  resources :images, only: [:create]
end
