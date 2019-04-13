class SchoolSerializer < ActiveModel::Serializer
  attributes :emis, :visting_date, :school_name, :district, :tehsil, :markaz,
              :school_level, :latitude, :longitude, :created_at,
              :updated_at
end