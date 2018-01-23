class Category < ApplicationRecord
  ## 關聯設定 一個分類 擁有多個(has_many) 餐廳
  ## 關聯設定 一但刪除某個分類 所屬餐廳也全部刪除
  has_many :restaurants, dependent: :destroy
end
