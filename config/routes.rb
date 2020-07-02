Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  resources :plans, only: %i[index show new create]

  namespace :api do
    namespace :v1 do
      resources :plans, only: [:index, :show]
      resources :orders, only: [:create]
    end
  end
end
