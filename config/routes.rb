# frozen_string_literal: true

Rails.application.routes.draw do
  root "users#index"
  devise_for :users, controllers: {
      registrations: "users/registrations",
      sessions: "users/sessions",
      passwords: "users/passwords"
  }
  resources :users, only: [:index, :show]
  scope "(:locale)" do
    resources :books
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
