class School < ApplicationRecord
  has_many :school_details, dependent: :destroy
end
