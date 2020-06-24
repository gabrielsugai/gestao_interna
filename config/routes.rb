Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  namespace :api do
    namespace :v1 do
      resources :plans, only: [:index, :show]
    end
  end
end
