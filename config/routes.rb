# frozen_string_literal: true

Rails.application.routes.draw do
  resources :messages
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root 'home#index'
end
