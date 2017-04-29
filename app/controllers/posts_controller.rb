class PostsController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_user!

  def index
    render json: {hi: 'hello'}
  end

  def create
  end

  def show
  end
end
