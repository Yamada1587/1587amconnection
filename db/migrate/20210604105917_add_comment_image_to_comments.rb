class AddCommentImageToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :commentimage, :string
  end
end
