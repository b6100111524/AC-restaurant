class Comment < ApplicationRecord
  ## 一則評論屬於一個使用者
  belongs_to :user
  ## 一則評論評給一間餐廳
  belongs_to :restaurant
end
