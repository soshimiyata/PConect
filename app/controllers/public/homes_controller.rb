class Public::HomesController < ApplicationController
  def top
    # 新規投稿4件をスライドショー
    @new_posts = Post.includes(:post_images)
                    .order(created_at: :desc)
                    .limit(4)
  end

  def about
  end
end
