Rails.application.routes.draw do
  namespace :admin do
    resources :users
    root to: "users#index"
  end
  resources :visitors, only: [:new, :create]
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
