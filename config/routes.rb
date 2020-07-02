Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :bots, only: %i[create]
  resources :plans, only: %i[index show new create edit update]
  resources :order_cancellation_requests, only: %i[index] do
    post :approve, on: :member
    post :reject, on: :member
  end

  namespace :api do
    namespace :v1 do
      resources :companies, only: %i[create]
      resources :plans, only: %i[index show]
      resources :orders, only: %i[create]
      resources :order_cancellation_requests, only: %i[create]
    end
  end
end
