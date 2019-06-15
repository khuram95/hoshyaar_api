class Api::V1::AdHocQueriesController < ApplicationController

  # def index
  #   data=''
  #   if params[:compare_by] == 'district'
  #     data = School.all.pluck(:district).uniq
  #   elsif params[:compare_by] == 'tehsil'
  #     data = School.all.pluck(:tehsil).uniq
  #   else
  #     data = School.all.pluck(:school_name, :emis).uniq
  #   end
  #   render json: data
  # end

  def create
    compelete_data = [{}]
    i=0
    params[:comparisonBetween].each do |district|
      data = School.where(district: district).flat_map(&:school_details)
      schools =  School.where(district: district)
      arr ={"#{district}"=>{}}
      arr["#{district}"]["total_schools"] = schools.count
      params[:comparisonOn].map do |q|
        # val = q == 'avaliable_fund' ? schools.pluck(q).sum : data.pluck(q).sum
        val = data.pluck(q).sum
        arr["#{district}"]["#{q}"] = val
      end
      compelete_data[i] = arr
      i += 1
    end
    render json: compelete_data
  end

  private

  def current_user
    User.find_by_id(params[:user_id])
  end

  def comment_params
    params.permit(:total_teacher)
  end
end




# School.where(district:'OKARA').each do |a|
#   params[:query].each do |query|
#     {
#       "#{}"
#     }
#   end
# end


# for each distict
#   data = School.where(district: 'OKARA').flat_map(&:school_details)
#   arr ={"#{dis}"=>{}}
#   params[:query].map do |q|
#     val = data.pluck(q).sum
#     arr["#{dis}"]["#{q}"] = val
#   end
# end