Rails.application.routes.draw do
  devise_for :staffs

  root to: "referrals#index"
  resources :referrals
  resources :staffs, only: [:edit, :update]
  resources :partners, only: [:new, :create]
  resources :doctors, only: [:new, :create]
end
