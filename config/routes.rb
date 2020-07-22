Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :homes, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:index, :new, :create]
    resources :notes, only: [:create]
  end
  resources :users, only: [:show]
end
