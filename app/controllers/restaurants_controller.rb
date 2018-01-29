class RestaurantsController < ApplicationController
  ## 建立驗證程序
  before_action :authenticate_user!
  
  ## 建立前台頁面 index 動作
  def index
    @restaurants = Restaurant.page(params[:page]).per(12)
    @categories = Category.all 
  end
  ## 建立展示頁面 show 動作 + 評論
  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new
  end

end
