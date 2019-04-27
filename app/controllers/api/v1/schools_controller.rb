class Api::V1::SchoolsController < ApplicationController

  def index
    # @schools = School.select(:district).map(&:district).uniq
    @schools = School.where(tehsil: params[:tehsil])
    render json: @schools
  end

  def district
    render json: School.distinct.pluck(:district)
  end

  def tehsil
    # byebug
    render json: School.where(district: params[:district]).distinct.pluck(:tehsil)
  end
end