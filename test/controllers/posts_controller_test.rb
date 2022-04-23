# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  fixtures :posts

  setup do
    @post = posts(:one)
  end

  test 'root should be the index page' do
    get '/'
    assert_equal 200, status
    # assert the content rendered
    assert_select 'h1', 'badbl0g'
    assert_select 'turbo-frame', id: 'posts'

    # user actions available
    assert_select 'turbo-frame', id: 'new_post'
  end

  test 'the posts page' do
    # get the posts page
    get '/posts'
    # assert that it works
    assert_equal 200, status
    # assert the content rendered
    assert_select 'h1', 'badbl0g'
    assert_select 'turbo-frame', id: 'posts'

    # user actions available
    assert_select 'turbo-frame', id: 'new_post'
  end

  test 'the posts page then show post and user actions' do
    # get the posts page
    get '/posts'
    # assert that it works
    assert_equal 200, status

    get post_url(@post.id), xhr: true
    assert_response :success

    assert_select 'turbo-frame', id: "posts_#{posts.first.id}"
    assert_select 'h2', @post.title.titleize

    # assert actions available
    assert_select 'a', 'Edit Post', 'Edit post is not available on Articles#show'
    assert_select 'button', 'Delete Post', 'Delete post is not available on Articles#show'
    assert_select 'a', 'Back to posts', 'Back to posts is not available on Articles#show'
  end

  test 'the show post page and verify tags are available' do
    get '/posts'
    assert_equal 200, status

    get post_url(@post.id), xhr: true

    assert_select('span', id: tags)
  end

  test 'delete the post from Posts#index' do
    get '/posts'
    assert_equal 200, status

    assert_difference 'Post.count', -1 do
      delete "/posts/#{@post.id}", xhr: true
    end
  end


  # TODO: Fix updating the post from Posts#index
  test 'updating the post from Posts#index' do
    get '/posts'
    assert_equal 200, status

    new_post = Post.new(title: 'the new title', body: 'the new body', tags: 'new tags')

    patch "/posts/#{@post.id}", params: new_post

    assert_response :success
  end


  # TODO: Do we need this test anyways prob need a system test
  test 'delete the post from Posts#show' do
    get post_url(@post.id), xhr: true
    assert_equal 200, status

    delete "/posts/#{@post.id}", xhr: true
  end

  test 'update the post from Posts#show' do
    skip 'updating the post from Posts#show waiting to be implemented'
  end
end
