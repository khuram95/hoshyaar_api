class VerifiedSchoolData < ApplicationRecord

  belongs_to :user
  belongs_to :school_detail

  validates_uniqueness_of :school_detail_id, scope: :user #user can verify one school detail only one time
end
