class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    render json: @user.posts
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    if @post.save
      render json: @post
    else
      render json: {error: 'there was an error saving post'}
    end
  end

  def show
    @post = Post.find_by(params.permit :id)
    render json: @post
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
