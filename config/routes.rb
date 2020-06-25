Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  
  root 'home#index'

  namespace :api do
    namespace :v1 do
      resources :companies, only: [:create]
    end
  end
end
