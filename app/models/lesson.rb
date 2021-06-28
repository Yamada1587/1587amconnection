class Lesson < ApplicationRecord
    belongs_to :user
    has_many :likes
    has_many :users, through: :likes
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
end
