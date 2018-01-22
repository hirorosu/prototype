class ChangeDatatypeSGradeOfStudents < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :s_grade, :integer
  end
end
