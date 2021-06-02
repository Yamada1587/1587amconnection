class Like < ApplicationRecord
  belongs_to :lesson
  belongs_to :user
  validates_uniqueness_of :lesson_id, scope: :user_id
end
