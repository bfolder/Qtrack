module ApplicationHelper
  def render_flashes()
    render 'shared/flashes'
  end

  def active_class?(path)
    return 'active' if request.url.include?(path)
    ''
  end
end
