Rails.application.routes.draw do
  devise_for :staffs

  root to: "referrals#index"
  resources :referrals do
    collection do
      get 'search'
      get 'plan'
    end
  end
  resources :staffs, only: [:edit, :update, :show]
  resources :partners, only: [:new, :create]
  resources :doctors, only: [:new, :create]
end
