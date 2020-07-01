Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  resources :bots, only: %i[index]
  resources :plans, only: %i[index show new create edit update]

  namespace :api do
    namespace :v1 do
      resources :plans, only: %i[index show]
      resources :companies, only:  %i[create]
    end
  end
end
