class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def create
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.user = current_user
    # @post_comment.idを取るのでここで定義
    @post_comment.post = @post
    if @post_comment.save
      @post.create_notification_post_comment!(current_user, @post_comment.id)
      flash[:success] = "コメントできました!"
    else
      flash[:error] = "コメントが失敗しました..."
    end
  end


  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    PostComment.find(params[:id]).destroy
    @post = Post.find(params[:post_id])
    # redirect_to post_path(params[:post_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

    # 投稿が現在のユーザーによって作成されたものであるか
  def ensure_correct_user
    @post = PostComment.find(params[:id])
    unless @post.user == current_user
      redirect_to root_path
    end
  end
end
