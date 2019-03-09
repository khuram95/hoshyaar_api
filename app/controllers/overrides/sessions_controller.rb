# frozen_string_literal: true

module Overrides
  # override devise_auth_token session controller
  class SessionsController < DeviseTokenAuth::SessionsController
    respond_to :json
    # override devise_auth_token create method
    def create
      @resource = User.find_by_phone_number(params[:phone_number])
      if @resource && @resource&.valid_password?(params[:password])
        @client_id, @token = @resource.create_token
        @resource.add_user_uid
        @resource.save
        sign_in(:user, @resource, store: false, bypass: false)
        render_create_success
      else
        render_create_error_bad_credentials # devise_auth_token method (parent class)
      end
    end

    def destroy
      byebug
      super
    end
  end
end
