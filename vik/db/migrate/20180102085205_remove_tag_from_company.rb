class RemoveTagFromCompany < ActiveRecord::Migration[5.1]
  def change
    remove_column :companies, :c_content, :text
  end
end
