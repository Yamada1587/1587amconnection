class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.text :lesson_name

      t.timestamps
    end
  end
end