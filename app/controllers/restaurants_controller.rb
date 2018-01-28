class RestaurantsController < ApplicationController
  ## 建立驗證程序
  before_action :authenticate_user!
  
  ## 建立前台頁面
  def index
    @restaurants = Restaurant.page(params[:page]).per(9)
  end

end
