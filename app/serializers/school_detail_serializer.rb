class SchoolDetailSerializer < ActiveModel::Serializer
  attributes :total_class_rooms, :use_class_rooms, :total_teacher, :non_teacher,
              :toilet_avaliable, :toilet_functional, :is_toilet_functional,
              :student_enrolled, :student_present, :is_electricity_avaliable,
              :is_drinking_water_avaliable, :is_boundary_wall, :avaliable_fund,
              :expenditure, :balance, :visiting_date
  # def expenditure
  #   object.school.non_salary_budgets.first.current_year_expenture
  # end

  # def balance
  #   object.school.non_salary_budgets.first.balance
  # end

  # def avaliable_fund
  #   object.school.non_salary_budgets.first.total_funds_available
  # end

  # def school
  #   object.first.school
  # end
end