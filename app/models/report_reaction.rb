class ReportReaction < ApplicationRecord
  belongs_to :report
  belongs_to :user
  validates_uniqueness_of :user_id, scope: :report #composite primary key
end
