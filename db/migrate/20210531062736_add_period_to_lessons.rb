class AddPeriodToLessons < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :period, :integer
  end
end
