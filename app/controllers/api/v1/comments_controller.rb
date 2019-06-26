class Api::V1::CommentsController < ApplicationController

  def index
    render json: report.comments
  end

  def create
    current_user.comments.create! comment_params
    current_user != report.user && OneSignalNotification.new(comment_create_notification, report.user, 'comment').call
    comments = Comment.joins(:user).where(report_id: params[:report_id])
    users = comments.map(&:user)
    users.each do |user|
      user != report.user && OneSignalNotification.new(comment_createon_comment_notification, user, 'comment').call
    end
    render json: report, each_serializer: ReportSerializer
  end

  def update
  end

  def destroy
  end

  private

  def report
    Report.find_by_id(params[:report_id])
  end

  def current_user
    User.find_by_id(params[:user_id])
  end

  def comment_params
    params.permit(:report_id, :text, :image)
  end

  def comment_create_notification
    NotificationData.comment_create(params[:report_id], current_user)
  end

  def comment_createon_comment_notification
    NotificationData.comment_create_on_comment(params[:report_id], current_user)
  end
end