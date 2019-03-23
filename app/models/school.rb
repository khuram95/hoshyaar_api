class School < ApplicationRecord
  has_many :school_details, dependent: :destroy
  has_many :subscribes
  has_many :users, through: :subscribes
end