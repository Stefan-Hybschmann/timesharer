Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :homes, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create] do
      member do
        get '/pending', to: 'bookings#pending', as: :pending
      end
    end
    member do
      get '/bookings', to: 'bookings#home_bookings', as: :home_bookings
    end
    resources :notes, only: [:index, :new, :create]
    resources :ownerships, only: [:index]
  end
  resources :bookings, only: [:index, :edit, :update, :destroy]
  resources :users, only: [:show]
  resources :notes, only: [:index, :new, :create, :destroy]
  resources :ownerships, only: [:edit, :update]
end
