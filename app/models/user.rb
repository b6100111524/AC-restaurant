class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## 判斷是否符合身份 role 字串是否符合身份
  def admin?
    self.role == "admin"
  end

end
