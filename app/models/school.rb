class School < ApplicationRecord
  has_many :school_details, dependent: :destroy
  has_many :subscribes
  has_many :users, through: :subscribes
  has_many :reports

  scope :by_district, ->(district) { where(district: district) }
  scope :by_tehsil, ->(tehsil) { where(tehsil: tehsil) }
end
