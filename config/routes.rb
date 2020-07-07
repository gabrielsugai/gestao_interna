Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  resources :bots, only: %i[create index]
  resources :plans, only: %i[index show new create edit update]
  resources :purchase_cancellations, only: %i[index show] do
    post :approve, on: :member
    post :reject, on: :member
  end

  namespace :api do
    namespace :v1 do
      resources :companies, only: %i[create]
      resources :plans, only: %i[index show]
      resources :purchases, only: %i[create]
      resources :purchase_cancellations, only: %i[create]
      resources :bot_chats, only: %i[create]
    end
  end
end
