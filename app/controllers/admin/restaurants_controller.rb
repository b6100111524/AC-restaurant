class Admin::RestaurantsController < ApplicationController
  ## 在登入帳號前 進行身份驗證
  before_action :authenticate_user!
  before_action :authenticate_admin  
  ## 建立後台頁面
  def index
    @restaurants = Restaurant.all
  end
end
