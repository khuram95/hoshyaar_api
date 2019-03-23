module AuthenticateRequest
  extend ActiveSupport::Concern
  included do
    def current_user
      raise Pundit::NotAuthorizedError unless current_user

      @current_host ||= current_user
    end

    def authenticate_user!
      render_unauthorized_error unless current_user
    end
  end
end
