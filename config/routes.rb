Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resource :contacts, only: [:new, :create]
end
