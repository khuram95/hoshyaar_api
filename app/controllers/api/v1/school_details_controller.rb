class Api::V1::SchoolDetailsController < ApplicationController

  before_action :school
  def index
    school.school_details
  end

  private

  def school
    School.find_by_id(params[:school_id])
  end
end