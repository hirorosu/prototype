class Company < ApplicationRecord
  validates :c_name, {presence: true}
  validates :c_email, {presence: true, uniqueness: true}
  validates :c_password, {presence: true}
  # validates :c_url, {presence: true}
  # validates :c_tel, {presence: true}
  # validates :c_content, {presence: true}
  # validates :c_industry, {presence: true}
  # validates :c_place, {presence: true}

  # "c_name", "c_email", "c_url", "c_tel", "c_content", "c_industry", "c_place"
  # presence:存在するかどうか、uniqueness:空白ではないか
end
