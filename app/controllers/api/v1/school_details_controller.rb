class Api::V1::SchoolDetailsController < ApplicationController

  before_action :school
  def index
    @school_details = school.school_details
    render json: @school_details
  end

  def verify_school_data
    user.verified_school_data.create!  school_detail_id: params[:school_detail_id], verifed_date: create_date
    head :ok
  end

  private

  def school
    School.find_by_emis(params[:school_id])
  end

  def user
    User.find_by_id(params[:user_id])
  end

  def school_detail
    SchoolDetail.find_by_id(params[:school_detail_id])
  end

  def create_date
    DateTime.now.utc.in_time_zone('Asia/Karachi')
  end
end