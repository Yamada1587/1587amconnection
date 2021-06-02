class AddDayToLessons < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :day, :integer
  end
end
