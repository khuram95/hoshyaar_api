class Api::V1::SchoolsController < ApplicationController

  def index
    render json: School.all
  end

  def sorted_data
      render json: School.by_district(params[:district]) if params[:district].present? 
      render json: School.by_tehsil(params[:tehsil]) if params[:tehsil].present? 
  end

end
