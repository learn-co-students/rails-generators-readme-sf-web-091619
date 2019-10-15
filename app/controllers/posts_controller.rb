class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.description = params[:post][:description]
    @post.post_status = params[:post][:post_status]
    @post.save
    redirect_to post_path(@post)
    # @post = Post.create(posts_params)
    # redirect_to post_path(@post)
  end

  def update
    @post = Post.update(posts_params)
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end


  
  private
    def posts_params
        params.require(:post).permit(:title, :description, :post_status)
     end
end
