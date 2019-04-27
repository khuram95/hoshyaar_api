class Comment < ApplicationRecord
  belongs_to :report
  belongs_to :user
  has_many :comment_photos
end
