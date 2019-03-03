class Optcode < ApplicationRecord
  validates_presence_of :opt_code, case_sensitive: false

  belongs_to :user
end
