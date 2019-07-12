class Api::V1::SchoolsController < ApplicationController

  def index
    # @schools = School.select(:district).map(&:district).uniq
    params[:tehsil].upcase! #upercase tehsil of neened
    @schools = School.where(tehsil: params[:tehsil])
    render json: @schools
  end

  def district
    render json: School.distinct.pluck(:district)
  end

  def tehsil
    render json: School.where(district: params[:district]).distinct.pluck(:tehsil)
  end

  def all_schools
    render json: School.first(40)
  end
end