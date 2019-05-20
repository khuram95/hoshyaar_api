class MyInterest < ApplicationRecord
  belongs_to :school
  belongs_to :user
  validates_uniqueness_of :user_id, scope: :school
end
