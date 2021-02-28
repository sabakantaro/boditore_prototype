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
  resources :post_ps
  post 'post_ps/create' => 'post_ps#create'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
  resources :notifications, only: :index
end
