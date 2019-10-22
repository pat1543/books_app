# frozen_string_literal: true

Rails.application.routes.draw do
  root "books#index"
  devise_for :users,
             skip: [
                 :registrations,
                 :sessions,
                 :passwords
             ],
             controllers: {
                 omniauth_callbacks: "users/omniauth_callbacks"
             }

  scope "(:locale)", locale: /ja|en/ do
    devise_for :users,
               skip: :omniauth_callbacks,
               controllers: {
        registrations: "users/registrations",
        sessions: "users/sessions",
        passwords: "users/passwords",
  }
  end

  scope "(:locale)", locale: /ja|en/ do
    resources :users, only: [:index, :show] do
      resources :followings, :followers, :books, :reports, :comments, only: [:index], module: "users"
    end
  end

  scope "(:locale)", locale: /ja|en/ do
    resources :books do
      resources :comments
    end
  end

  scope "(:locale)", locale: /ja|en/ do
    resources :feeds, only: [:index]
  end

  scope "(:locale)", locale: /ja|en/ do
    resources :memberships, only: [:create, :destroy]
  end

  scope "(:locale)", locale: /ja|en/ do
    resources :reports do
      resources :comments
    end
  end

  scope "(:locale)", locale: /ja|en/ do
    resources :comments
  end
end
