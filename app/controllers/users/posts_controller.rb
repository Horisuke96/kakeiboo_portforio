class Users::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params_post)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user == current_user
        render "edit"
    else
        redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params_post)
      flash[:success] = "収入カテゴリを変更しました"
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:alert] = "投稿を削除しました"
      redirect_to posts_path
    else
      @post = Post.all
      render :index
    end
  end

private
  def params_post
    params.require(:post).permit(:title, :body, :post_image)
  end
end
