# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root 'home#index'

  resources :users, only: %i[show] do
    resources :messages, only: %i[index create destroy]
  end
end
