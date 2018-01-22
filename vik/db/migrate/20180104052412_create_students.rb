class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :s_name
      t.string :s_email
      t.integer :s_grade
      t.string :s_school
      t.string :s_password
      t.string :s_image

      t.timestamps
    end
  end
end
