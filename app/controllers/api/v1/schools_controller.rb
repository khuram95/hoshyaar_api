class Api::V1::SchoolsController < ApplicationController

  def index
    render json: School.all
  end

  def sorted_data
    School.by_district(params[:district]) if params[:district]
    School.by_tehsil(params[:tehsil]) if params[:tehsil]
    School.find_by_id(params[school_id]) if params[:school_id]
  end

end
