module ProjectsHelper
  def print_issue_counter(project)
      a_spell = project.issues.size == 1 ? 'issue' : 'issues'
      "#{project.issues.size} #{a_spell} - #{project.issues.select{|i| i.is_resolved == false}.size} open"
  end
end
