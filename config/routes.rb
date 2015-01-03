Rails.application.routes.draw do
  resources :locations

  resources :categories

  root to: 'visitors#index'
  get '/categories/:id/posts', to: 'categories#posts', as: 'category_posts'
  get '/posts/:id/reply', to: 'posts#reply', as: 'reply_post'
  post '/posts/:id/email/reply', to: 'posts#email_reply', as: 'email_reply_post'
  devise_for :users, :controllers => {:registrations => "my_registrations"}
  resources :users
  resources :posts
end
