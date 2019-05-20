# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern
  NotAuthorized = Class.new(StandardError)

  def render_name_error(object)
    raise NameError, full_error_messages(object)
  end

  def render_unauthorized_error
    unauthorized_user
  end

  def full_error_messages(object)
    object.errors.full_messages.join(', ')
  end

  included do
    rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ::ActiveRecord::RecordInvalid, with: :error_occurred
    rescue_from ::ActiveRecord::RecordNotUnique, with: :not_unique
    rescue_from ::NameError, with: :error_occurred
    rescue_from ::RuntimeError, with: :error_occurred
    rescue_from ::SocketError, with: :error_occurred
    rescue_from ::Errno::ECONNREFUSED, with: :error_occurred
    rescue_from ::ActionController::RoutingError, with: :error_occurred
    rescue_from ::Pundit::NotAuthorizedError, with: :unauthorized_user
    rescue_from ApplicationController::NotAuthorized, with: :invalid_credentials
    rescue_from ::ActiveRecord::RecordNotSaved, with: :email_already_exist

    protected

    def invalid_credentials
      render json: { status: 'error',
                     errors: 'Invalid login credentials. Please try again.',
                     code: RESPONSE_CODE[:unauthorized] }
    end

    def record_not_found(error)
      render json: { status: 'error',
                     errors: "#{error.model.to_s.downcase} not found",
                     code: RESPONSE_CODE[:not_found] }
    end

    def not_unique
      render json: { status: 'success',
                     errors: 'Device already registered',
                     code: RESPONSE_CODE[:success] }
    end

    def email_already_exist
      render json: { errors: 'Verification failed: Email already exists' }.to_json, status: 422
    end

    def error_occurred(error)
      render json: { errors: error.message,
                     code: RESPONSE_CODE[:bad_request],
                     status: 400 }.to_json
    end

    def unauthorized_user
      render json: { errors: 'You don\'t have permissions to access this page' }.to_json, status: 401
    end

    def reset_password_error(error)
      render json: { errors: error,
                     code: RESPONSE_CODE[:bad_request],
                     status: 400 }.to_json
    end

    def render_error(errors)
      render json: {  errors: errors,
                      code: RESPONSE_CODE[:bad_request],
                      status: 400 }.to_json
    end
  end
end
