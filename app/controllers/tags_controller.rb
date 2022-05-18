# frozen_string_literal: true

class TagsController < ApplicationController
  before_action :set_tag_and_posts, only: :show

  def index
    @tags = Tag.created_at_desc
  end

  def update; end

  def show
    respond_to do |format|
      format.html
    end
  end

  def create; end

  def destroy
    @tag.destroy
    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = 'Tag deleted!' }
      format.html { flash.now[:notice] = 'Tag deleted!' }
    end
  end

  private

  def set_tag_and_posts
    @tag = Tag.find params[:id]
    @post = Post.includes(:tags).where('posts.id = ?', @tag.taggable_id).references(:posts)
  end

end
