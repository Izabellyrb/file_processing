# frozen_string_literal: true

require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  get "up" => "rails/health#show", as: :rails_health_check

  mount Sidekiq::Web => '/sidekiq'

  get "/report", to: "file_processes#report"
  get "/index", to: "file_processes#index"
  post "/import_file", to: "file_processes#import_file"

  root to: "home#home"
end
