class Api::V1::SchoolsController < ApplicationController

  def index
    # @schools = School.select(:district).map(&:district).uniq
    @schools = School.where(district: 'LAHORE')
    render json: @schools
  end

  def sorted_data
      render json: School.by_district(params[:district]) if params[:district].present?
      render json: School.by_tehsil(params[:tehsil]) if params[:tehsil].present?  
  end
end