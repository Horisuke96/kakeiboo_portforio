class Users::PostCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]


  def create
    @post = Post.find(params[:post_id])
    @comment = PostComment.new(post_comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    @comment.save
    render :comment

  end

  def destroy
    @post = Post.find(params[:post_id])
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    render :comment
  end


  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

  def correct_user
  @comment = PostComment.find(params[:id])
    if current_user.id != @comment.user.id
      redirect_to posts_path
    end
  end
end
