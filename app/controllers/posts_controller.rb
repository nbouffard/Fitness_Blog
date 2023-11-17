class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    # @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, status: :created
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category)
  end
end

# if post_params[:tag_ids].present?
#       post_params[:tag_ids].each do |tag_id|
#         @post.post_tags.create(tag_id: tag_id)
#       end
#     end
#     if post_params[:category_id].present?
#       @post.category_id = post_params[:category_id]
#     end
# , tags_attributes: [:tags]
