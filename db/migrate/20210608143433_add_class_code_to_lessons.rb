class AddClassCodeToLessons < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :class_code, :string
  end
end
