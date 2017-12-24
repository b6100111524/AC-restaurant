Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "restaurants#index"
  
  # 後台路由設定 建立admin管理權限
  namespace :admin do
    root "restaurants#index"
  end
end
