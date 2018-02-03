class UsersController < ApplicationController

  ## 建立 使用者 頁面展示
  def show
    @user = User.find(params[:id])
  end

end
