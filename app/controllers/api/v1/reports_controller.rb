class Api::V1::ReportsController < ApplicationController

  def index
     @reports = Report.all
     render json: @reports.reverse
  end

  def create
    # curent_user add it her and authenticate before action
    byebug
    report = Report.create! report_params
    report.photos.create! photo_params
    render json: report
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
end