class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new 
    @post = Post.new
  end

  def create 
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_url, notice: 'Post created!'}
      else
        format.html { redirect_to new_posts_url, notice: 'Post could not be created!', status: :unprocessable_entity }
      end
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    #TODO: Implement
  end

  def update
    #TODO: Implement
  end

  def destroy
    #TODO: Implement
  end

  private
  def post_params
    params.require(:post).permit( :title, :body, :tags )
  end
end
