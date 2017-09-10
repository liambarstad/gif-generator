Rails.application.routes.draw do
  root "main#dashboard"

  resources :gifs, only: [:index, :show] do
    resources :favorites, only: [:create]
  end
  resources :favorites, only: [:destroy]
  namespace :user do
    resources :favorites, only: [:index]
    resources :categories, only: [:index, :show]
  end

  resources :users, only: [:new, :create]
  resources :categories, only: [:index, :show, :new, :create, :destroy]

  get "/admins/login", to: "admins#loginpage"
  post "/admins/login", to: "admins#login"
  delete "/admins/logout", to: "admins#logout"
  get "/users/login", to: "users#loginpage"
  post "/users/login", to: "users#login"
  delete "/users/logout", to: "users#logout"
end
