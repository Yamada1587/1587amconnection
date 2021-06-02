class AddQuarterToLessons < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :quarter, :string
  end
end
