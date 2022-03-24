class PostsController < ApplicationController
  before_action :set_post, only: %w[show update destroy]

  def index
    @post = Post.order(created_at: :desc)
  end
  def new
    @post = Post.new
  end

  def show
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def update
    if(@post.update(post_params))
      redirect_to @post
    else
      render 'edit'
    end 
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create 
    #render plain: params[:post].inspect
    @post = Post.new(post_params)


    if(@post.save)
      redirect_to @post
    else
      render 'new'
    end
  end

  private 
  
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end