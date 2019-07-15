class Api::V1::ReportsController < ApplicationController

  def index
    @reports = request.user_agent.length < 15 ? Report.where(is_removed: false).last(5) : Report.all
    render json: @reports.reverse
  end

  def create
    # curent_user add it her and authenticate before action
    @report = Report.create! report_params
    @report.update! authencity: calculate_authenticity, report_date: report_date
    for i in 0..params[:image_count].to_i-1
      image = 'image'+i.to_s
      @report.photos.create! image: params[image.to_sym]
    end
    User.all.each do |user|
      (get_distance(user) < 5.0 || user.my_interests.find_by_school_id(@report.school_id)) && curent_user != user &&  OneSignalNotification.new(report_create_notification, user, 'report').call
    end
    render json: @report
  end

  def user_reports
    user_reports = curent_user.reports.order( 'created_at DESC' ).first(5)
    render json: user_reports, each_serializer: ReportSerializer
  end

  private


  def get_distance(user)
    distance = Geocoder::Calculations.distance_between([user.latitude, user.longitude], [@report.latitude,@report.longitude])
    (distance*1.60934)
  end

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
    if(params[:image0].present?)
      authenticity = authenticity + 25
    end
    authenticity
  end

  def report_create_notification
    NotificationData.report_create(@report.id, @report.school)
  end

  def report_date
    DateTime.now.utc.in_time_zone('Asia/Karachi')
  end
end