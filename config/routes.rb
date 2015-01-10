Rails.application.routes.draw do
  resources :vehicles

  root to: 'visitors#index'
  devise_for :users
  resource :contacts, only: [:new, :create]
end
