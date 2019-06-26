# frozen_string_literal: true

module Overrides
  # override devise_auth_token session controller
  class SessionsController < DeviseTokenAuth::SessionsController
    respond_to :json
    before_action :remove_device_id, only: %i[destroy]
    # override devise_auth_token create method
    def create
      @resource = User.find_by_phone_number(params[:phone_number])
      if @resource && @resource&.valid_password?(params[:password])
        @client_id, @token = @resource.create_token
        @resource.add_user_uid
        @resource.save
        sign_in(:user, @resource, store: false, bypass: false)
        update_lat_long
        add_device_id
        render_create_success
      else
        render_create_error_bad_credentials # devise_auth_token method (parent class)
      end
    end

    def destroy
      super
    end

    private

    def add_device_id
      unless @resource.device_ids.include? params[:device_id]
        @resource.device_ids << params[:device_id] if params[:device_id].present?
        @resource.save
      end
    end

    def update_lat_long
      @resource.update! longitude: params[:longitude], latitude: params[:latitude]
    end

    def remove_device_id
      @resource.device_ids.delete(params[:device_id])
      @resource.save
    end
  end
end
