class Api::V1::ReportsController < ApplicationController

  def index
     @reports = Report.all
     render json: @reports.reverse
  end

  def create
    # curent_user add it her and authenticate before action
    report = Report.create! report_params
    report.photos.create! photo_params
    # OneSignalNotification.new(report_create_notification, User.all).call
    render json: report
  end

  def show
    # render json: Report.all
    user_reports = curent_user.reports.order( 'created_at DESC' )
    render json: user_reports, each_serializer: ReportSerializer
  end


  def update
    # update report by user or admin?
  end

  def destory
    # soft delete
  end

  private

  def report_params
    params.permit(:report_text, :longitude, :latitude, :school_id, :user_id)
  end

  def photo_params
    params.permit(:image)
  end

  def curent_user
    User.find(params[:user_id])
  end

  # def report_create_notification
  #   NotificationData.report_create(@package.id, @package.title, current_user.first_name)
  # end

  def self.report_create_notification(report_id)
    {
      type: 'new_report_created',
      report_id: report_id,
      description: "A new report create in your region,."  #should we add user name which create the report or school name?
    }
  end
end