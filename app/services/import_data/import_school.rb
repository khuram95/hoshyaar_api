# class ImportSchool
#   def call
#     schools =  CSV.foreach('school_data.csv', headers: true) do|school|
#       School.create! (
#         emis: school[0].to_i,
#         school_name: school[1],
#         district: school[2],
#         tehsil: school[3],
#         markaz: school[4],
#         school_level: school[5],
#         latitude: school[6].to_f
#         longitude: school[7].to_f
#       )
#     end
#   end
# end