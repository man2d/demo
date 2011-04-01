#coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
#  before_filter :create_devise_resource
  
#  def create_devise_resource
#    resource = 
#  end
private
def after_sign_in_path_for(resource)
logger.info resource.email
  if resource.is_a?(User) && !resource.activated?
    sign_out resource
    flash[:notice] = "Ваша учетная запись еще не активирована"
    new_session_path
  elsif resource.is_a?(AdminUser)
    
    admin_path
  else
   super
  end

end
end
