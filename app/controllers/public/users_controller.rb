class Public::UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :authenticate_user!, only: [:show]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
  
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
