# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  School.create do |school|
    school.emis = Faker::IDNumber.valid
    school.visting_date = Faker::Date.forward(0)
    school.school_name = Faker::Company.name
    school.district = Faker::Address.city
    school.tehsil = Faker::Address.street_name
    school.markaz = Faker::Address.street_address
    school.school_level = 'primary'
    school.latitude = Faker::Address.latitude
    school.longitude = Faker::Address.longitude
    3.times do
      school.school_details.new do |school_detail|
        school_detail.total_class_rooms = Faker::Number.decimal_part(2)
        # school_detail.use_class_rooms = Faker::Number.decimal_part(2)
        school_detail.total_teacher = Faker::Number.decimal_part(2)
        school_detail.non_teacher = Faker::Number.decimal_part(2)
        school_detail.toilet_avaliable = Faker::Number.decimal_part(2)
        school_detail.toilet_functional = school_detail.toilet_avaliable #- Faker::Number.decimal_part(1)
        school_detail.is_toilet_functional = Faker::Boolean.boolean
        school_detail.student_enrolled = Faker::Number.decimal_part(3)
        school_detail.student_present = school_detail.student_enrolled #- Faker::Number.decimal_part(2)
        school_detail.is_electricity_avaliable = Faker::Boolean.boolean
        school_detail.is_drinking_water_avaliable = Faker::Boolean.boolean
        school_detail.is_boundary_wall = Faker::Boolean.boolean
        school_detail.avaliable_fund = Faker::Number.decimal_part(7)
        school_detail.expenditure = school_detail.avaliable_fund #- Faker::Number.decimal_part(5)
        school_detail.balance = school_detail.expenditure
        school_detail.school_id = school.emis
      end
    end
  end
end