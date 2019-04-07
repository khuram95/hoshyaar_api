class Api::V1::ReportsController < ApplicationController

  def index
    render json: Report.all
  end

  def create
    # curent_user add it her and authenticate before action
    Report.create! report_params
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
end