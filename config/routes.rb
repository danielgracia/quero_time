# frozen_string_literal: true

Rails.application.routes.draw do
  resources :skill_levels
  resources :comments
  resources :invitations
  resources :user_skills
  resources :projects
  resources :teams
  resources :skills
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  # Omniauth callback
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # Welcome screen
  get '/welcome', to: 'home#welcome'
end
