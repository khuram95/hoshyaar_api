module Api
  module V1
    class UsersController < ApplicationController
      def index
        @users = User.all
        render json: @users
      end

      def toggle_status
        user.update! is_active: !user.is_active
        render json: User.all
      end

      private

      def user
        User.find_by_id(params[:user_id])
      end

    end
  end
end