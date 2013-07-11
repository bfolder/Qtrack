require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'Comment requires content' do
    comment = Comment.new
    assert !comment.save, 'Should not save project without content'

    comment.content = 'Test'
    assert comment.save, 'Should save comment'
    assert comment.content == 'Test', 'Content should be equal to Test'
  end
end
