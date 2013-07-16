require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    sign_in User.first
    @comment = comments(:one)
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, comment: { content: @comment.content }
    end

    assert_redirected_to comment_path(assigns(:comment))
  end
end
