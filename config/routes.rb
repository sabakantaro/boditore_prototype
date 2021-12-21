# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  get  '/home',    to: 'home#index'
  get  '/signup',  to: 'users#new'
  get  '/ranks',  to: 'ranks#index'

  namespace :api do
    namespace :v1 do
      resources :users
      resources :posts
    end
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :users do
    get :search, on: :collection
  end

  resources :posts do
    get :search, on: :collection
  end

  resources :posts do
    resources :comments, only: :create
  end

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: %i[create destroy]

  resources :notifications, only: %i[index destroy]

  resources :posts do
    post 'add' => 'favorites#create'
    delete '/add' => 'favorites#destroy'
  end

  resources :messages, only: [:create]
  resources :rooms, only: %i[create show index]
  resources :posts, only: %i[edit update destroy]
end
