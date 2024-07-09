# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"
  get "/:slug", to: "articles#show", as: :article

  namespace :admin do
    get "/dashboard", to: "dashboard#index", as: :dashboard
    resources :articles
    resources :labels
    resources :social_links
  end
end
