class SImageToStudents < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :s_image, :string
  end
end
