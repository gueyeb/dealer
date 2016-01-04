Rails.application.routes.draw do
  root to: 'vehicles#index'

  devise_for :users, skip: :registrations

  authenticate :user do
    resources :vehicles, only: [:new, :create, :edit, :update, :destroy] do
      resources :images, only: [:new, :create, :destroy] do
        member do
          get :download
        end
      end
    end
  end

  resources :vehicles, only: [:index, :show]
  resources :contacts, only: [:new, :create]
end
