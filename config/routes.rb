Rails.application.routes.draw do
  resources :locations

  resources :categories

  root to: 'visitors#index'
  get 'home' => 'visitors#home'
  get '/categories/:id/posts', to: 'categories#posts', as: 'category_posts'
  devise_for :users, :controllers => {:registrations => "my_registrations"}
  resources :users
  resources :posts
end
