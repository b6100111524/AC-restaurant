class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ##
  validates_presence_of :name
  ## 上傳照片
  mount_uploader :avatar, AvatarUploader
  ## 一位使用者可以提供多則評論
  ## has_many :comments
  ## 如果 User 已經有了評論，就不允許刪除帳號（刪除時拋出 Error）
  has_many :comments, dependent: :restrict_with_error

  ## 一位使用者可以評論多間餐廳 透過 comment 連結關係
  has_many :restaurants, through: :comments

  before_save :initialize_name
  # 如果 name 沒有值的話, 請初始化一個值給它, 而這個初始化的值是 user 填的 email @前面的字串
  def initialize_name
    if self.name == "" || self.name == nil
      self.name = self.email.split('@').first
    end
  end

  ## 判斷是否符合身份 role 字串是否符合身份
  def admin?
    self.role == "admin"
  end

end
