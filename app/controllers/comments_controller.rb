class CommentsController < ApplicationController
  ## 建立 評論
  def create
    # 確認目標餐廳
    @restaurant = Restaurant.find(params[:restaurant_id])
    # 建立一則評論 內容必須通過私有驗證 build = new
    @comment = @restaurant.comments.build(comment_params)
    # 確認使用者
    @comment.user = current_user
    # 儲存評論內容
    @comment.save!
    # 重新導向 show 更新頁面
    redirect_to restaurant_path(@restaurant)
  end

  ## 刪除 評論
  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = Comment.find(params[:id])
    # 通過驗證 必須為管理者才能刪除
    if current_user.admin?
      @comment.destroy
      redirect_to restaurant_path(@restaurant)
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
