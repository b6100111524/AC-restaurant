Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "restaurants#index"
  
  # 後台路由設定 建立admin管理權限 (使用前置字元定義)
  namespace :admin do
    resources :restaurants      #設定後台路由
    resources :categories       #設定分類路由
    root "restaurants#index"
  end
end
