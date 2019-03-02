# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :models
  # get '/api' => redirect('/swagger/dist/index.html?url=/apidocs/api-docs.json')
  namespace :api do
    namespace :v1 do
      resources :users, only: :index
    end
  end
end
