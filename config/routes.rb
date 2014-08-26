Rails.application.routes.draw do
  resources :locations

  resources :categories

  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :posts
end
