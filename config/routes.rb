# frozen_string_literal: true

require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  get "up" => "rails/health#show", as: :rails_health_check

  mount Sidekiq::Web => '/sidekiq'

  resources :file_processes, only: [:show, :index] do
    collection do
      post :import_file
    end
  end
  root to: "home#home"
end
