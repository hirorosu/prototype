class AddTagToCompany < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :c_content, :string
  end
end
