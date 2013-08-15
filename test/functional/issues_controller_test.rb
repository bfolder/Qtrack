require 'test_helper'

class IssuesControllerTest < ActionController::TestCase
  setup do
    sign_in User.first
    @issue = issues(:one)
    @project = projects(:one)
    @user = users(:one)
    @issue.user = @user
    @issue.project = @project
    @issue.save
  end

  test 'should get new' do
    get :new, project_id: @project.id
    assert_response :success
  end

  test 'should create issue' do
    assert_difference('Issue.count') do
      post :create, issue: { content: @issue.content, is_resolved: @issue.is_resolved, name: @issue.name, priority: @issue.priority }, project_id: @project.id
    end

    assert_redirected_to @project
  end

  test 'should show issue' do
    get :show, id: @issue
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @issue
    assert_response :success
  end

  test 'should update issue' do
    put :update, id: @issue, issue: { content: @issue.content, is_resolved: @issue.is_resolved, name: @issue.name, priority: @issue.priority }
    assert_redirected_to issue_path(assigns(:issue))
  end

  test 'should destroy issue' do
    assert_difference('Issue.count', -1) do
      delete :destroy, id: @issue
    end

    assert_redirected_to @project
  end
end
