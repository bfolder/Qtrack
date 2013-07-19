module IssuesHelper
  def print_resolved_message(issue)
    "--- RESOLVED"  if issue.resolved?
  end

  def print_resolve_button(issue)
    if issue.resolved?
      link_to 'Mark as unresolved', resolve_issue_path(@issue), class: 'btn btn-wuxia btn-primary'
    else
      link_to 'Mark as resolved', resolve_issue_path(@issue), class: 'btn btn-wuxia btn-success'
    end
  end
end