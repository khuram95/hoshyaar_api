class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :report

  #for size validation
#   validate :image_size_validation

# private
#   def image_size_validation
#     errors[:image] << "should be less than 2MB" if image.size > 2.0.megabytes
#   end
end
