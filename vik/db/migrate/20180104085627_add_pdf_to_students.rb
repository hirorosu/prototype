class AddPdfToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :pdf, :string
  end
end
