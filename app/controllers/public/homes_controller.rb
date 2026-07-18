class Public::HomesController < ApplicationController
  def top
    @posts = Post.includes(:user, :post_images, :tags).order(created_at: :desc)
                .page(params[:page]).per(6)
    # 新規投稿4件をスライドショー
    @new_posts = Post.includes(:post_images)
                    .order(created_at: :desc)
                    .limit(4)
  end

  def about
  end
end
