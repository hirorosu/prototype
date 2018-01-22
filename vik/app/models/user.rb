class User < ApplicationRecord
  # nameカラムに関するバリデーション
  validates :name, {presence: true}

  # emailカラムに関するバリデーション
  validates :email, {presence: true, uniqueness: true}
end
