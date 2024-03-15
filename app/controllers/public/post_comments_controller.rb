class Public::PostCommentsController < ApplicationController

def create
  @post = Post.find(params[:post_id])
  @post_comment = PostComment.new(post_comment_params)
  @post_comment.user = current_user
  @post_comment.post = @post
  if @post_comment.save
    @post.create_notification_post_comment!(current_user, @post_comment.id)
    flash[:success] = "Comment created successfully"
  else
    flash[:error] = "Failed to create comment"
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

end
