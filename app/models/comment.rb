class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  mount_uploader :commentimage, ImageUploader, dependent: :destroy
end
