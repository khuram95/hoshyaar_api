class SchoolDetail < ApplicationRecord
  belongs_to :school
  has_many :verified_school_datas
end
