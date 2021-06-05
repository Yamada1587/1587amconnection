class AddMessageImageToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :message_image, :string
  end
end
