Rails.application.routes.draw do

  devise_for :users
  root 'home#index'
  get  '/home',    to: 'home#index'
  get  '/signup',  to: 'users#new'
  get 'post_ps/index'
  get 'post_qs/index'
  resources :users
  resources :post_qs
  post 'post_qs/create' => 'post_qs#create'
  resources :post_ps
  post 'post_ps/create' => 'post_ps#create'
end
