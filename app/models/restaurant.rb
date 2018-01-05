class Restaurant < ApplicationRecord
  ## 加入表單內容驗證 設定 name 為必填
  validates_presence_of :name
end
