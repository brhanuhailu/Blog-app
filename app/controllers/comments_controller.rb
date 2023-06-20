class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @current_user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.author = @current_user
    @comment.post = @post
    if @comment.save
      redirect_to user_post_path(@current_user.id, params[:post_id])
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
