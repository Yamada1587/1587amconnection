class AddAcademicYearToLessons < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :academic_year, :integer
  end
end
