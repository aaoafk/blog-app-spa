# frozen_string_literal: true

class TagsController < ApplicationController
  before_action :set_tag, only: :show
  def index; end

  def update; end

  # TODO: Show will display all the articles that this tag is linked to
  def show; end

  # TODO: Implement TagsController#create
  def create; end

  # TODO: Implement TagsController#destroy
  def destroy; end

  private

  def set_tag
    @tag = Tag.find(id: params[:id])
  end

  # TODO: Figure out what to do with TagsController#destroy_tags
  # and TagsController#update_tags
  def destroy_tags(post); end

  def update_tags(post); end
end
