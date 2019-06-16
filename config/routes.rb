# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users

  constraints format: :json do
    mount_devise_token_auth_for 'User', at: 'auth',
      skip: [:omniauth_callbacks],
      controllers: {
        registrations:     'overrides/registrations',
        # passwords:         'overrides/passwords',
        sessions:          'overrides/sessions',
        # token_validations: 'overrides/token_validations'
      }
    # devise_scope :user do
    #   put '/update_user', to: 'overrides/registrations#update_user'
    # end

    namespace :api do
      namespace :v1 do
        resources :otp_codes, only: :update
        resources :users, only: :index
        resources :schools, only: :index
        resources :school_details
        resources :reports
        resources :comments
        resources :report_reactions
        resources :my_interests
        resources :notifications, only: :index
        resources :ad_hoc_queries, only: :create
        get '/reports/user_reports', to: 'reports#user_reports'
        get '/schools/district', to: 'schools#district'
        get '/schools/tehsil', to: 'schools#tehsil'
      end
    end
  end
end
