class AddPasswordToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :c_password, :string
  end
end
