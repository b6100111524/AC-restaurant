class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!  # 驗證請求進入後台的是否為已登入的 User

  private
  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = "Not allow!"
      redirect_to root_path
    end
  end
end
