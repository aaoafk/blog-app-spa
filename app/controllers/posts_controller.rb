class PostsController < ApplicationController

  before_action :set_post, only: %i[ show edit update destroy ]

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
  end

  def edit
  end

  def update
    update_status = @post.update( post_params )
    respond_to do |format|
      if update_status 
        format.html { redirect_to @post, notice: 'Post successfully updated!' }
      else
        format.html { redirect_to edit_post_url( @post ), notice: 'Post could not be updated', status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post successfully destroyed' }
    end
  end

  private
  def set_post
    @post = Post.find( params[:id] )
  end

  def post_params
    params.require(:post).permit( :title, :body, :tags )
  end
end
