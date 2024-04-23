class Public::HomesController < ApplicationController
  def top
    @posts = Post.page(params[:page]).per(6)
    @posts_all = Post.all
    # 新規投稿4件をスライドショー
    @new_posts = @posts_all.sort_by { |post| post.created_at }.reverse.first(4)
  end

  def about
  end
end
