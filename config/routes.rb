# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts
  resources :tags, only: %i[index show create update destroy]

  root 'posts#index'
end
