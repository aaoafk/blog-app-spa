# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :tags, only: %i[index show create update destroy]

  root to: 'posts#index'
end
