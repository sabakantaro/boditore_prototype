Rails.application.routes.draw do

  root 'home#index'
  get  '/home',    to: 'home#index'
  get  '/signup',  to: 'users#new'

  devise_for :users

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :users do
  get :search, on: :collection
  end

  resources :posts do
  get :search, on: :collection
  end

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]

  resources :notifications, only: [:index, :destroy]

  resources :posts do
    post 'add' => 'favorites#create'
    delete '/add' => 'favorites#destroy'
  end

  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]

  post 'posts/new' => 'posts#new'
  post 'posts/create' => 'posts#create'
  post "posts/:id/update" => "posts#update"

end
