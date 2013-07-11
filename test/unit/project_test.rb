require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test 'Project requires a name' do
    project = Project.new
    assert !project.save, 'Should not save project without a name'

    project.name = 'Test'
    assert project.save, 'Should save project'
    assert project.name == 'Test', 'Name should be equal to Test'
  end

  test 'Project has issues' do
    project = Project.create(name: 'Testproject')
    issue = Issue.create(name: 'Testissue', content: 'Testcontent')
    project.issues << issue

    assert project.issues.last, 'Project should have an issue'
    assert project.save, 'Project should save'
  end
end
