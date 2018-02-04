class Category < ApplicationRecord
  validates_presence_of :name
  ## 關聯設定 一個分類 擁有多個(has_many) 餐廳
  ## 關聯設定 一但刪除某個分類 所屬餐廳也全部刪除
  ## has_many :restaurants, dependent: :destroy
  ## 如果分類下已有餐廳，就不允許刪除分類（刪除時拋出 Error）
  has_many :restaurants, dependent: :restrict_with_error
  ## has_many :restaurants, dependent: :restrict_with_exception
end
