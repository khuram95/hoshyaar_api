class Api::V1::AdHocQueriesController < ApplicationController

  def index
    data=''
    if params[:compare_by] == 'district'
      data = School.all.pluck(:district).uniq
    elsif params[:compare_by] == 'tehsil'
      data = School.all.pluck(:tehsil).uniq
    else
      data = School.all.pluck(:school_name, :emis).uniq
    end
    render json: data
  end

  private

  def current_user
    User.find_by_id(params[:user_id])
  end
end