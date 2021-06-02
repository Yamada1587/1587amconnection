class AddLikesCountToLessons < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :like_count, :integer
  end
end
