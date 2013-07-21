module ApplicationHelper
  def render_flashes()
    render 'shared/flashes'
  end

  def project_active?
    return 'active' if @project || @issue
    ''
  end

  def user_list_active?
    return 'active' if !@project && !@issue
    ''
  end
end