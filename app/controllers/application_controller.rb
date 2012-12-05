class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resources

  def layout_by_resources
  	devise_controller? ? 'login' : 'application'
  end

end
