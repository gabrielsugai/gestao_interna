Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :bots, only: %i[create]
  resources :plans, only: %i[index show new create edit update]

  namespace :api do
    namespace :v1 do
      resources :companies, only: %i[create]
      resources :plans, only: %i[index show]
      resources :orders, only: %i[create] do
        post 'cancel', on: :member
      end
    end
  end
end
