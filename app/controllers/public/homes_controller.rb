class Public::HomesController < ApplicationController
  def top
    @posts = Post.all
    @new_posts = @posts.sort_by { |post| post.created_at }.reverse.first(4)
  end

  def about
  end
end
