class Admin::CategoriesController < ApplicationController
  ## 身份驗證程序
  before_action :authenticate_user!  # 驗證請求進入後台的是否為已登入的 User
  before_action :authenticate_admin  # 驗證該 User 身份是否為網站管理員
  ## 把私有方法限定給 update, destory
  before_action :set_category, only: [:update, :destroy]
  ## 類別頁面展示 index 動作
  def index
    @categories = Category.all
    if params[:id]
      # 叫出類別名稱
      @category = Category.find(params[:id])
    else
      # 使用 new 新增空物件
      @category = Category.new
    end
  end
  ## 創造新的類別 create 動作
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was successfully created!"
      redirect_to admin_categories_path
    else
      @categories = Category.all
      render :index
    end
  end
  ## 上傳修改的類別 update 動作
  def update
    # @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path
      flash[:notice] = "Category was successfully updated!"
    else
      @categories = Category.all
      render :index
    end
  end
  ## 刪除類別 destory 動作
  def destroy
    # @category = Category.find(params[:id])
    @category.destroy
    flash[:alert] = "Category was successfully deleted!"
    redirect_to admin_categories_path
  end



  ## 私有方法
  private
  ## 資安驗證
  def category_params
    params.require(:category).permit(:name)
  end
  ## 程式碼重構
  def set_category
    @category = Category.find(params[:id])
  end
end
