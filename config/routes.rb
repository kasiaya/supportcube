Rails.application.routes.draw do
  devise_for :staffs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "referrals#index"
  resources :staffs, only: [:edit, :update]
  resources :partners, only: [:new, :create]
  resources :doctors, only: [:new, :create]
end
