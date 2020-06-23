Rails.application.routes.draw do
  devise_for :users

  root 'home#index'
  resources :plans, only: %i[index]
end
