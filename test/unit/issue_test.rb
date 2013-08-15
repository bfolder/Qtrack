require 'test_helper'

class IssueTest < ActiveSupport::TestCase
  test 'Issues requires a name and content' do
    issue = Issue.new
    assert !issue.save, 'Should not save project without a name'

    issue.name = 'Test'
    issue.content = 'Test'
    assert issue.save, 'Should save project'
    assert issue.name == 'Test', 'Name should be equal to Test'
    assert issue.content == 'Test', 'Content should be equal to Test'
  end

  test 'Issue has comments' do
    issue = Issue.new
    issue.name = 'Testissue'
    issue.content = 'Testcontent'

    comment = Comment.new
    comment.content = 'Testcontent'
    issue.comments << comment

    assert issue.comments.last, 'Issue should have a comment'
    assert issue.save, 'Issue should save'
  end
end
