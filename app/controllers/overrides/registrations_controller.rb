module Override
  class RegistrationsControlller < DeviseTokenAuth::RegistrationsController
    respond_to :json

    def create
      User.create! create_params
    end

    private

    def create_params
      params.permit(:phone_number, :user_name, :password, :latitude, :longitude)
    end
  end
end