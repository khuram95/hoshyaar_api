module Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    respond_to :json

    def new
      User.transaction do
        @user = User.create! create_params
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