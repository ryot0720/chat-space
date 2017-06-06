Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :users, only: %i[edit update]
  resources :messages, only: :index
end
