# frozen_string_literal: true

# This imp will primarily be responsible for handling
# updates that need to happen for posts
class TagConstructionImp
  attr_reader :post, :post_params

  def initialize(post:, post_params:)
    @post = post
    @post_params = post_params
  end

  def associate_post_to_tags
    the_tags = extract_tags(post_params[:tag_names])
    the_tags.each do |tag|
      @post.tags.create({ title: tag })
    end
  end

  private

  def extract_tags(tag_names)
    return tag_names.scan(/\w+/) unless tag_names.empty?

    []
  end
end
