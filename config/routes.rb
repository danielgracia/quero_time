# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  resources :skill_levels
  resources :comments
  resources :invitations
  resources :user_skills
  resources :projects
  resources :teams
  resources :skills
  resources :users
  resources :team_requirements

  # Slack permissions callback
  get '/auth/slack_permissions/callback', to: 'sessions#update'
  # Omniauth callback
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # Welcome screen
  get '/bemvindo', to: 'home#welcome', as: :welcome
  # Invite
  match '/users/:id/invite', to: 'users#invite', via: [:get, :post], as: :invite_user
end
