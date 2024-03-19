class Admin::PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page]).per(9).order('updated_at DESC')
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end
end
