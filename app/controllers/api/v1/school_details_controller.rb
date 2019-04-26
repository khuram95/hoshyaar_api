class Api::V1::SchoolDetailsController < ApplicationController

  before_action :school
  def index
    @school_details = school.school_details
    render json: @school_details
  end


  private

  def school
    School.find_by_emis(params[:school_id])
  end
end