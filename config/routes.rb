Rails.application.routes.draw do
  resources :squires
  devise_for :users
  root 'projects#index'
  resources :projects do
    resources :courses
  end
  resources :orders, only: [:new, :create]
  resources :order_details, only: [:create]
end
