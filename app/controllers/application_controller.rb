class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resources

  def layout_by_resources
  	devise_controller? ? 'login' : 'application'
  end
  
  private

  def after_sign_in_path_for(resource)
 	user_dashboard_path(current_user)
  end

  def after_sign_out_path_for(resource_or_scope)
  	users_path
  end
 end
