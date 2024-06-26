class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
    #postにネストしているpost_imageの定義
    @post_images = @post.post_images.build
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_tags = @post.tags
     unless
     ReadCount.find_by(user_id: current_user.id, post_id: @post.id)
     current_user.read_counts.create(post_id: @post.id)
     end
  end

  def index
    @posts = Post.page(params[:page]).per(9).order('updated_at DESC')
    @tag_list=Tag.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    #受け取った値を,で区切る
    tag_list = params[:post][:name].split(',').uniq
    #byebug
    if @post.save
      @post.save_tag(tag_list)
      redirect_to post_path(@post), notice: "投稿に成功しました!"
    else
      flash.now[:notice] = "投稿に失敗しました..."
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list=@post.tags.pluck(:name).join(',')
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:name].split(',').uniq
    if @post.update(post_params)
      @post.save_tag(tag_list)
      redirect_to post_path(@post), notice: "投稿を更新しました!"
    else
      flash.now[:notice] = "投稿の編集に失敗しました..."
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "投稿が削除できました!"
  end

  def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list=Tag.all
    @tag=Tag.find(params[:tag_id])
    @posts=@tag.posts.page(params[:page]).per(10)
  end


  private

  def post_params
    params.require(:post).permit(:title, post_images_attributes: [:id, :text, :_destroy, :image])
  end

  # 投稿が現在のユーザーによって作成されたものであるか
  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to root_path
    end
  end
end
