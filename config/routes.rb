Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  resources :plans, only: %i[index show new create]
  resources :bots, only: %i[index]

  namespace :api do
    namespace :v1 do
      resources :plans, only: [:index, :show]
    end
  end
end
