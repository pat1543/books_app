# frozen_string_literal: true

Rails.application.routes.draw do
  root "books#index"
  devise_for :users, controllers: {
      registrations: "users/registrations",
      sessions: "users/sessions",
      passwords: "users/passwords",
      omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users, only: [:index, :show] do
    resources :followings, :followers, only: [:index], module: "users"
  end
  scope "(:locale)" do
    resources :books
  end
  resources :follow_relationships, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
