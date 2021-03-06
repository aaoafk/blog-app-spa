# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.created_at_desc
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.except(:tag_names))
    respond_to do |format|
      if @post.save
        TagConstructionImp.new(post: @post, post_params: post_params).associate_post_to_tags
        format.turbo_stream { flash.now[:notice] = :success_create }
        format.html { redirect_to posts_url, notice: 'Post created!' }
      else
        format.turbo_stream
        format.html { redirect_to new_post_url, notice: 'Post could not be created!', status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.update(@post), locals: @post, partials: 'posts/post' }
      format.html
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @post.update(post_params.except(:tag_names))
        TagConstructionImp.new(post: @post, post_params: post_params).associate_post_to_tags
        format.html { redirect_to post_url(@post), notice: 'Post successfully updated!' }
      else
        format.html { redirect_to edit_post_url(@post), notice: 'Post could not be updated', status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = 'Post deleted!' }
      format.html { redirect_to posts_url, notice: 'Post deleted!' }
    end
  end

  private

  def set_post
    @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit(:title, :body, :tag_names)
  end
end
