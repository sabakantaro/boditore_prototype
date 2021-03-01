Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root 'home#index'
  get  '/home',    to: 'home#index'
  get  '/signup',  to: 'users#new'
  get 'post_ps/index'
  get 'post_qs/index'
  resources :users
  resources :post_qs
  post 'post_qs/create' => 'post_qs#create'
  post 'post_qs/new' => 'post_qs#new'
  resources :post_ps
  post 'post_ps/create' => 'post_ps#create'
  post 'post_ps/new' => 'post_ps#new'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
  resources :notifications, only: :index
  resources :post_qs do
    post 'add' => 'favorite_qs#create'
    delete '/add' => 'favorite_qs#destroy'
  end
  resources :post_ps do
    post 'add' => 'favorite_ps#create'
    delete '/add' => 'favorite_ps#destroy'
  end
  resources :users do
  get :search, on: :collection
  end
end
