Rails.application.routes.draw do
  resources :vehicles

  root to: 'vehicles#index'
  devise_for :users
  resource :contacts, only: [:new, :create]
end
