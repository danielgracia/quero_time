Rails.application.routes.draw do

  resources :invitations
  resources :user_skills
  resources :projects
  resources :teams
  resources :skills
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  # Omniauth callback
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # Login
  get '/login', to: 'sessions#index'
  resources :users

end
