class CommentsController < ApplicationController
  def index
    @post = Post.find_by post_param
    render json: @post.comments
  end

  def create
    @post = Post.find_by post_param
    @comment = @post.comments.new(comments_params)
    if @comment.save
      render json: {message: 'Comment successfully saved'}
    else
      render json: {message: 'Oops the comment could not be saved'}
    end
  end

  def show
    @post = Post.find_by post_param
    render json: @post.comments
  end

  private
  def comments_params
    params.require(:comment).permit(:body)
  end

  def post_param
    {id: params.require(:post_id)}
  end
end
