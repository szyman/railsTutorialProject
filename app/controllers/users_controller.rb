class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def index
    @users = User.all
  end
  
  def create
    @user = User.new(post_params.permit(:login, :email))
    
    if @user.save
      redirect_to @user
    else 
      render 'new'
    end
    #render text: params[:post].inspect
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    
    if @post.update(params[:post].permit(:title, :text))
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    redirect_to posts_path
  end
  
  private
    def post_params
      params.require(:user)
    end  
  
  
end
