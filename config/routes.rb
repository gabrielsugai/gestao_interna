Rails.application.routes.draw do
  devise_for :users
  
  root to: 'home#index'

  resources :plans, only: %i[index show new create]

  namespace :api do
    namespace :v1 do
      resources :companies, only: [:create]
      resources :plans, only: [:index, :show]
    end
  end
end
