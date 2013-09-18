class PostsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end
  
  def index
    @user = User.find(params[:user_id])
    @posts = Post.all
  end
  
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(params[:post].permit(:title, :text))
    redirect_to user_posts_path(@user)
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end
  
  def update
    @user = User.find(params[:user_id])
    
    @post = @user.posts.find(params[:id])
    
    if @post.update(params[:post].permit(:title, :text))
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @post.destroy
    
    redirect_to user_posts_path(@user)
    
    #@post = Post.find(params[:id])
    #@post.destroy
    
    #redirect_to posts_path
  end
  
  private
    def post_params
      params.require(:post)
    end
  
end
