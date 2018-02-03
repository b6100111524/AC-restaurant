class UsersController < ApplicationController
  ## 共用私有指令 在執行特定 action 時先執行
  before_action :set_user, only: [:show, :edit, :update]

  ## 建立 使用者 展示功能
  def show
  end
  ## 建立 使用者 編輯功能
  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end
  ## 建立 使用者 更新功能
  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  ## 私有指令
  private
  ## 讀取 使用者 內容
  def set_user
    @user = User.find(params[:id])
  end
  ## 驗證程序
  def user_params
    params.require(:user).permit(:name, :intro)
  end
end
