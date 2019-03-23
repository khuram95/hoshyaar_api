class Otpcode < ApplicationRecord
  validates_presence_of :otp_code, case_sensitive: false

  belongs_to :user
end
