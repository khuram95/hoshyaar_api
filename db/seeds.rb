# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

# 1.times do

#   User.create do |user|
#     user.phone_number = Faker::PhoneNumber.phone_number
#     user.user_name = Faker::Name.first_name
#     user.latitude = Faker::Address.latitude
#     user.longitude = Faker::Address.longitude
#     user.is_verified = Faker::Boolean.boolean
#     user.password = 123123
#     user.uid = Faker::Number.decimal_part(12)
#     School.create do |school|
#       school.id = Faker::Number.decimal_part(3)
#       school.emis = Faker::IDNumber.valid
#       school.visting_date = Faker::Date.forward(0)
#       school.school_name = Faker::Company.name
#       school.district = Faker::Address.city
#       school.tehsil = Faker::Address.street_name
#       school.markaz = Faker::Address.street_address
#       school.school_level = 'primary'
#       school.latitude = Faker::Address.latitude
#       school.longitude = Faker::Address.longitude
#       3.times do
#         school.school_details.new do |school_detail|
#           school_detail.total_class_rooms = Faker::Number.decimal_part(2)
#           # school_detail.use_class_rooms = Faker::Number.decimal_part(2)
#           school_detail.total_teacher = Faker::Number.decimal_part(2)
#           school_detail.non_teacher = Faker::Number.decimal_part(2)
#           school_detail.toilet_avaliable = Faker::Number.decimal_part(2)
#           school_detail.toilet_functional = school_detail.toilet_avaliable #- Faker::Number.decimal_part(1)
#           school_detail.is_toilet_functional = Faker::Boolean.boolean
#           school_detail.student_enrolled = Faker::Number.decimal_part(3)
#           school_detail.student_present = school_detail.student_enrolled #- Faker::Number.decimal_part(2)
#           school_detail.is_electricity_avaliable = Faker::Boolean.boolean
#           school_detail.is_drinking_water_avaliable = Faker::Boolean.boolean
#           school_detail.is_boundary_wall = Faker::Boolean.boolean
#           school_detail.avaliable_fund = Faker::Number.decimal_part(7)
#           school_detail.expenditure = school_detail.avaliable_fund #- Faker::Number.decimal_part(5)
#           school_detail.balance = school_detail.expenditure
#           school_detail.school_id = school.emis
#         end
#       end
#     end
#   end
# end



require 'csv'

# school_csv = File.read(Rails.root.join('lib', 'seeds', 'SchoolTableData.csv'))
# csv = CSV.parse(school_csv, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   school = School.new
#   school.emis= row['emis'],  # fist line after new in null, so thats why assign again at end
#   school.school_name=row['school_name'],
#   school.district= row['district'],
#   school.tehsil= row['tehsil'],
#   school.markaz= row['markaz'],
#   school.school_level= row['school_level'],
#   school.latitude= row['latitude'].to_f,
#   school.longitude= row['longitude'].to_f,
#   school.emis= row['emis'],
#   school.save
# end

# school_detail_csv = File.read(Rails.root.join('lib', 'seeds', 'SchoolDetailTableData.csv'))
# csv_school_detail = CSV.parse(school_detail_csv, :headers => true, :encoding => 'ISO-8859-1')
# csv_school_detail.each do |row|
#   school_detail = SchoolDetail.new
#   school_detail.balance = row['balance'],
#   school_detail.visiting_date = row['visiting_date'],
#   school_detail.school_id = row['rs_school_emis_code'],
#   school_detail.total_class_rooms = row['total_Class_rooms'],
#   school_detail.use_class_rooms = row['use_class_rooms'],
#   school_detail.total_teacher = row['total_teacher'],
#   school_detail.non_teacher = row['non_teacher'],
#   school_detail.toilet_avaliable = row['toilets_available'],
#   school_detail.toilet_functional = row['toilets_functional'],
#   school_detail.is_toilet_functional = row['is_toilet_functional'],
#   school_detail.student_enrolled = row['student_enrolled'],
#   school_detail.student_present = row['student_present'],
#   school_detail.is_electricity_avaliable = row['is_electricity_avaliable'],
#   school_detail.is_drinking_water_avaliable = row['is_drinkinging_water_functional'],
#   school_detail.is_boundary_wall = row['is_boundary_functional'],
#   school_detail.avaliable_fund = row['avalible_fund'],
#   school_detail.expenditure = row['expenditure'],
#   school_detail.balance = row['balance'],
#   school_detail.visiting_date = row['visiting_date'],
#   school_detail.save
# end

non_salary_budget_csv = File.read(Rails.root.join('lib', 'seeds', 'NonSalaryBudget.csv'))
non_salary_budget_parse = CSV.parse(non_salary_budget_csv, :headers => true, :encoding => 'ISO-8859-1')
non_salary_budget_parse.each do |row|
  school_detail = SchoolDetail.find_by_school_id(row['rs_school_emis_code'])
  school_detail.update! balance:  row['sc_balance'], expenditure: row['sc_total_exp_current_year'], avaliable_fund: row['total_funds_available']
  # non_salary_budget = NonSalaryBudget.new
  # non_salary_budget.balance = row['sc_balance']
  # non_salary_budget.school_id = row['rs_school_emis_code']
  # non_salary_budget.current_year_expenture = row['sc_total_exp_current_year']
  # non_salary_budget.balance = row['sc_balance']
  # non_salary_budget.total_funds_available = row['total_funds_available']
  # non_salary_budget.save
end