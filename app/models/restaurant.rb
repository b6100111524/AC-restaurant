class Restaurant < ApplicationRecord
  ## 加入表單內容驗證 設定 name 為必填
  validates_presence_of :name
  ## 掛載上傳圖片的功能套件 
  mount_uploader :image, PhotoUploader
  ## 關聯設定 每個餐廳 個別屬於(belongs_to) 一個分類
  ## 關連設定 允許存在 未分類的餐廳
  belongs_to :category, optional: true
  ## 一間餐廳擁有多則評論
  has_many :comments
end
