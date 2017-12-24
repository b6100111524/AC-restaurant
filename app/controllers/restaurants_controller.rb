class RestaurantsController < ApplicationController
  ## 建立驗證程序
  before_action :authenticate_user!
  
  ## 建立前台頁面
  def index
  end
end
