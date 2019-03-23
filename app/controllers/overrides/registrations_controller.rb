# frozen_string_literal: true

module Overrides
  # override devise_atuh_token resistration controller
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    respond_to :json

    def new
      User.transaction do
        @user = User.new create_params
        @user.add_user_uid
        @user.save!
        CreateAndSendVerificationCode.new(@user).call
        render json: @user
      end
    end

    protected

    def create_params
      params.permit(:phone_number, :user_name, :password, :latitude, :longitude)
    end
  end
end
