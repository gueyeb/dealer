Rails.application.routes.draw do
  root to: 'vehicles#index'

  devise_for :users, skip: :registrations

  resources :vehicles, only: [:new, :index, :show]
  resources :contacts, only: [:new, :create]

  authenticate :user do
    resources :vehicles, only: [:create, :edit, :update, :destroy] do
      resources :images, only: [:new, :create] do
        member do
          get :download
        end
      end
    end
  end

end
