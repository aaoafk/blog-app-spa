# frozen_string_literal: true

# This imp will primarily be responsible for handling
# updates that need to happen for posts
class TagConstructionImp

  # TODO: Need to use strong params here, i.e. just a hash...
  # Would it be better to build this in the service layer or
  # add a TagsController?

  # post = instance of post that was saved in posts controller,
  # tag_names = tags that user inputed separated by a space
  def tag_builder(post, tag_names)
    extract_tags(tag_names).each do |tag|
      post.tags.create(tag)
    end
  end

  def tag_destroyer(post)
    # This would prob be done using around_destroy
  end

  def tag_updater(post)
    # TODO: Implement updating the tag here
    # This would need to be implemented using a callback
  end

  private

  def extract_tags(tag_names)
    return tag_names.scan(/\w+/) unless tag_names.empty?

    []
  end
end
