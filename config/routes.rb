Rails.application.routes.draw do
  # Routes for SESSION CONTROLLER
  root "sessions#new"
  post '/sessions' => "sessions#create"
  delete '/' => "sessions#destroy", as: 'logout'
  get '/sessions' => "sessions#new"

  # Routes for USER CONTROLLER
  resources :users
  resources :details, only: [:new,:create,:edit,:update]
  resources :emergencies, only: [:new,:create,:edit,:update]
  resources :accounts, only: [:new,:create,:edit,:update]
  resources :pays, only: [:create, :show]
  resources :pers, only: [:edit, :update]
  get "/pays/new/:id" => "pays#new", as: "new_pay"
end
