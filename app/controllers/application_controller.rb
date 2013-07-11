class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  layout :layout_by_resource

  def after_sign_out_path_for(resource_or_scope)
    # Little hard coded
    '/users/sign_in'
  end

protected
  def layout_by_resource
    if devise_controller?
      'login'
    else
      'application'
    end
  end
end
