# frozen_string_literal: true

class PostsMasterJob < ApplicationJob
  queue_as :default

  # It doesn't make sense to do anything that is done in the
  # PostsController as a job, they should be executed immediately
  # and a lot of the logic depends on database transactions happening
  # etc etc but maybe we could do something fucked for learning
  # purposes ^_^

  def perform(*args)
    # Do something later
    post = args[0] || nil
    action = args[1] || nil
  end
end
