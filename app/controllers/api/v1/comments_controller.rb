class Api::V1::CommentsController < ApplicationController

  def index
    render json: report.comments
  end

  def create
    current_user.comments.create! comment_params
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
end