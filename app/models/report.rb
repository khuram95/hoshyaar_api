class Report < ApplicationRecord
  belongs_to :user
  belongs_to :school, class_name: 'School', optional: true
  has_many :photos
  has_many :comments
  has_many :report_reactions
  has_many :notifications
  # mount_uploader :video, VideoUploader
  # mount_uploader :voice_message, AudioUploader

end
