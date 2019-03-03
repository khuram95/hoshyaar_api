module Overrides
  class SessionsController < DeviseTokenAuth::SessionsController
    respond_to :json

    def create
      super
    end

    # private

    # def create_params
    #   params.permit(:phone_number, :user_name, :password, :latitude, :longitude)
    # end
  end
end