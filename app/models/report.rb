class Report < ApplicationRecord
  belongs_to :user
  belongs_to :school, class_name: 'School', optional: true
  has_many :photos
  has_many :comments
  has_many :report_reactions
  mount_uploader :voice_message, SoundUploader

end
