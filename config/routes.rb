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
        resources :otp_codes, only: :index
        resources :users, only: :index
        resources :schools
        get '/schools/sorted_data', to: 'schools#sorted_data'
      end
    end
  end
end
