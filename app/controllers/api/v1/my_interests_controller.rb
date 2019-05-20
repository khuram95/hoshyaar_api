class Api::V1::MyInterestsController < ApplicationController

  def index
    @my_interests  = []
    current_user.my_interests.map { |interest|
      if(!interest.school.reports.empty?)
        interest.school.reports.map { |report| @my_interests << report }
      end
      }
    render json: @my_interests.compact
  end

  def create
    interest = current_user.my_interests.create! interest_params
    render json: interest
  end

  def destory
    current_user.my_interests.destory
  end

  def current_user
    User.find_by_id(params[:user_id])
  end

  private

  def interest_params
    params.permit(:school_id)
  end
end