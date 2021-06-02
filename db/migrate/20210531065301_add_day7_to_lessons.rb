class AddDay7ToLessons < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :day7, :string
  end
end
