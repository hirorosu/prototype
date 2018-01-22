class AddColumnSGradeOfStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :s_grade, :string
  end
end
