class Api::V1::NotificationsController < ApplicationController

  def index
    render json: user.notifications.reverse, each_serializer: NotificationSerializer
  end

  private

  def user
    User.find(params[:user_id])
  end
end