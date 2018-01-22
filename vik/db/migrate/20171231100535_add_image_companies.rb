class AddImageCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :image, :string
  end
end
