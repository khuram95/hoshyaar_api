class Api::V1::ReportsController < ApplicationController

  def index
     @reports = Report.last(3)
     render json: @reports.reverse
  end

  def create
    # curent_user add it her and authenticate before action
    @report = Report.create! report_params
    @report.update! authencity: calculate_authenticity
    @report.photos.create! photo_params
    User.all.each do |user|
      OneSignalNotification.new(report_create_notification, user).call
    end
    render json: @report
  end

  def show
    # render json: Report.all
    user_reports = curent_user.reports.order( 'created_at DESC' ).first(3)
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
    params.permit(:report_text, :longitude, :latitude, :school_id, :user_id, :voice_message, :video )
  end

  def photo_params
    params.permit(:image)
  end

  def curent_user
    User.find(params[:user_id])
  end

  def calculate_authenticity
    authenticity=0
    if(params[:report_text].present?)
      authenticity=25
    end
    if(params[:voice_message].present?)
      authenticity = authenticity + 25
    end
    if(params[:video].present?)
      authenticity = authenticity + 25
    end
    if(params[:image].present?)
      authenticity = authenticity + 25
    end
    authenticity
  end

  def report_create_notification
    NotificationData.report_create(@report.id, @report.school)
  end
end