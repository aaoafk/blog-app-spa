class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new 
    #TODO: Implement
  end

  def create 
    #TODO: Implement
  end

  def show
    #TODO: Implement
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
