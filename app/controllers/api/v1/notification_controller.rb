class Api::V1::NotificationController < ApplicationController

  def index
    user.notifications
  end

  private

  def user
    User.find(params[:user_id])
  end
end