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

  def update
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      if @post.update(post_params)
        redirect_to post_path(@post), status: :accepted
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, status: :ok
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
