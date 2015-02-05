Rails.application.routes.draw do
  root to: 'vehicles#index'

  devise_for :users

  resources :vehicles do
    resources :images, only: [:new, :create] do
      member do
        get :download
      end
    end
  end
  resources :contacts, only: [:new, :create]

end
