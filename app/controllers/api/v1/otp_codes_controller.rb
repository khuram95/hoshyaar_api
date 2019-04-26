class Api::V1::OtpCodesController < ApplicationController

  def update
    if(verify_code)
      user.otpcode.destroy
      @updated_user = update_user
      render json: user#, serializer: UserSerializer
    else
      render json: {error: 'invalid Security Code'}
    end
  end

  def destory

  end

  private

  def verify_code
    user&.otpcode&.otp_code === params[:otp_code]
  end

  def user
    User.find_by_phone_number(params[:phone_number])
  end

  def update_user
    user.update! is_verified: true
  end
end