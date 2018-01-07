class Restaurant < ApplicationRecord
  ## 加入表單內容驗證 設定 name 為必填
  validates_presence_of :name
  ## 掛載上傳圖片的功能套件 
  mount_uploader :image, PhotoUploader
end
