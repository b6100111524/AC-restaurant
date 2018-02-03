class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## 上傳照片
  mount_uploader :avatar, AvatarUploader
  
  ## 一位使用者可以提供多則評論
  has_many :comments

  ## 判斷是否符合身份 role 字串是否符合身份
  def admin?
    self.role == "admin"
  end

end
