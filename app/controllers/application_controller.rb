class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  layout :layout_by_resource

protected
  def layout_by_resource
    if devise_controller?
      'login'
    else
      'application'
    end
  end
end
