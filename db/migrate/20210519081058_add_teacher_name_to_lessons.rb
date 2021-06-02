class AddTeacherNameToLessons < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :teacher_name, :text
  end
end
