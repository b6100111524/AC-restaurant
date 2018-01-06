class Admin::RestaurantsController < ApplicationController
  ## 在登入帳號前 進行身份驗證
  before_action :authenticate_user!
  before_action :authenticate_admin
  ## 把私有方法限定給 show, edit & update
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  ## 建立後台 index 動作
  def index
    @restaurants = Restaurant.all
  end
  ## 建立後台 new 動作
  def new
    @restaurant = Restaurant.new
  end
  ## 建立後台 create 動作
  def create
    @restaurant = Restaurant.new(restaurant_params)
    # 顯示對應的 flash message
    if @restaurant.save
      flash[:notice] = "Restaurant was successfully created!"     # 跳頁顯示訊息
      redirect_to admin_restaurants_path                          # 回到 index 頁面
    else
      flash.now[:alert] = "Restaurant was failed to create!"      # 原頁面顯示訊息
      render :new                                                 # 留在 new 頁面
    end
  end
  ## 建立後台 show & edit 動作 游絲有方法 set_restaurant 取代 
  ## def show; end
  ## def edit; end
  ## 建立後台 update 動作
  def update
    if @restaurant.update(restaurant_params)
      flash[:notice] = "Restaurant was successfully updated!"
      redirect_to admin_restaurant_path(@restaurant)
    else
      flash.now[:alert] = "Restaurant was failed to update!"
      render :edit
    end
  end
  ## 建立後台 destory 動作
  def destroy
    @restaurant.destroy
    redirect_to admin_restaurants_path
    flash[:alert] = "restaurant was deleted"
  end




  ## 私有方法
  private
  ## 資安驗證
  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hour, :tel_on, :address, :description)
  end
  ##
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
