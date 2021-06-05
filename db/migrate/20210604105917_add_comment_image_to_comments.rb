class AddCommentImageToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :comment_image, :string
  end
end
