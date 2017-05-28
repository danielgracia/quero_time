Rails.application.routes.draw do

  resources :invitations
  resources :user_skills
  resources :teams
  resources :skills
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  # Omniauth callback
  post '/auth/:provider/callback', to: 'sessions#create'
  # Login
  get '/login', to: 'sessions#index'
end
