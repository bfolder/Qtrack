module ProjectsHelper
  def print_issue_counter(project)
    a_spell = project.issues.size == 1 ? 'issue' : 'issues'
    "#{project.issues.size} #{a_spell} - #{project.issues.select{|i| i.is_resolved == false}.size} open"
  end

  def print_priority_string(issue)
    case issue.priority
      when 0
        return 'Low'
      when 1
        return 'Normal'
      when 2
        return 'High'
    end
  end
end
