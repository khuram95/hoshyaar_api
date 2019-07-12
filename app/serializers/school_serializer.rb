class SchoolSerializer < ActiveModel::Serializer
  attributes :emis, :visting_date, :school_name, :district, :tehsil, :markaz,
              :school_level, :latitude, :longitude, :created_at, :total_reports,
              :total_intested_user, :updated_at,

  def total_reports
    object.reports.count
  end
  def total_intested_user
    object.my_interests.count
  end
end