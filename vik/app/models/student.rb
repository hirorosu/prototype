class Student < ApplicationRecord
  validates :s_name, {presence: true}
  validates :s_email, {presence: true, uniqueness: true}
  validates :s_password, {presence: true}
  # validates :s_grade, {uniqueness: true}
  # validates :s_school, {uniqueness: true}
  # validates :s_image, {presence: true}

  # "s_name", "s_email", "s_password", "s_grade", "s_school", "s_image"
  # presence:存在するかどうか、uniqueness:空白ではないか
end
