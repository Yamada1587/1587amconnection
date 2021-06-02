class RemoveDayFromLesson < ActiveRecord::Migration[6.1]
  def change
    remove_column :lessons, :day, :integer
  end
end
