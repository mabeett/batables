BaseProject::Application.routes.draw do
  get "log_in" => "sessions#new", :as => "log_in"
  post 'sessions', to: 'sessions#create', as: 'sessions'
  delete "log_out" => "sessions#destroy", :as => "log_out"

  resources :users

  root to: 'sessions#new'
end
