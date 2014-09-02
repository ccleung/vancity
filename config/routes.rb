Rails.application.routes.draw do
  resources :locations

  resources :categories

  root to: 'visitors#index'
  get 'home' => 'visitors#home'
  devise_for :users
  resources :users
  resources :posts
end
