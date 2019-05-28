class Api::V1::NotificationsController < ApplicationController

  def index
    # byebug
    render json: user.notifications, each_serializer: NotificationSerializer
  end

  private

  def user
    User.find(params[:user_id])
  end
end