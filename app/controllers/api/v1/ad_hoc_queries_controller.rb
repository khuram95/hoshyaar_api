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

      data = ''
      if params[:comparisonName] === 'district'
        data = SchoolDetail.joins(:school).where(schools: {district: district})
      elsif params[:comparisonName] === 'tehsil'
        data = SchoolDetail.joins(:school).where(schools: {tehsil: district})
      elsif params[:comparisonName] === 'school'
        render json: {error: 'please wait it not complete yet'}
        data = SchoolDetail.find_by_school_id(district.emis)
      else
        render json: {error: 'please select comparison type'}
      end
      arr ={"#{district}"=>{}}
      arr["#{district}"]["total_schools"] = data.count
      params[:comparisonOn].map do |cmp|
        if (cmp==='toilet_avaliable' || cmp === 'is_electricity_avaliable' || cmp === 'is_drinking_water_avaliable' || cmp === 'is_boundary_wall')
          arr["#{district}"]["#{cmp}"] = data.where(cmp.to_sym => true).count
        else
          val = data.pluck(cmp).sum
          arr["#{district}"]["#{cmp}"] = val
        end
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