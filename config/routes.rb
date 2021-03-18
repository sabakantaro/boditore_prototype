Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root 'home#index'
  get  '/home',    to: 'home#index'
  get  '/signup',  to: 'users#new'
  resources :users
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
  resources :users do
  get :search, on: :collection
  end
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]

  post 'posts/create' => 'posts#create'
  post "posts/:id/update" => "posts#update"

end
