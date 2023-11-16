class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @posts = Post.all
  end



  def new
    @post = Post.new
    # @tag = Tag.new
    # @category = Category.new
    # @user = current_user
  end
end
