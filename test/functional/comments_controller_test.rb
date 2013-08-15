require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    sign_in User.first
    @comment = comments(:one)
    @issue = issues(:one)
    @issue.comments << @comment
    @issue.save
  end

  test 'should create comment' do
    assert_difference('Comment.count') do
      post :create, comment: { content: @comment.content }, issue_id: @issue.id
    end

    assert_redirected_to @issue
  end
end
