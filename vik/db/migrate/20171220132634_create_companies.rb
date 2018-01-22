class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :c_name
      t.string :c_email
      t.string :c_url
      t.string :c_tel
      t.text :c_content
      t.string :c_industry
      t.string :c_place

      t.timestamps
    end
  end
end
