class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  mount_uploader :comment_image, ImageUploader
end
