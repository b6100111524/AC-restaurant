Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "restaurants#index"

  # 前台路由設定 只允許 index & show
  # 透過巢狀資源 do end 包覆 comment 的功能
  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
  end 
  # 使用者簡介 頁面瀏覽 只允許 show edit & update
  resources :users, only: [:show, :edit, :update]

  # 前台分類瀏覽 只允許 show
  resources :categories, only: :show

  # 後台路由設定 建立admin管理權限 (使用前置字元定義)
  namespace :admin do
    resources :restaurants      #設定後台路由
    resources :categories       #設定分類路由
    root "restaurants#index"
  end

end
