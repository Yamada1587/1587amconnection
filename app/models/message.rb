class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :notifications, dependent: :destroy
  mount_uploader :message_image, ImageUploader
end
