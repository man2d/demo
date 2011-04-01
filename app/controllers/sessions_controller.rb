#coding: utf-8
class SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create ]

  include Devise::Controllers::InternalHelpers

  # GET /resource/sign_in
  def new
    clean_up_passwords(build_resource)
    render_with_scope :new
  end

  # POST /resource/sign_in
  def create
#    resource_name = "user"
    resource = warden.authenticate!(:scope => resource_name, :recall => :new)
#s    resource = warden.set_user(resource, :scope => scope)
#    if resource.is_a?(User) && !resource.activated?
#      set_flash_message :notice, "Учетная запись еще не активирована"
#      redirect_to new_session_path
#    else
#       render :text => resource.to_xml
       set_flash_message :notice, :signed_in
       sign_in_and_redirect(resource_name, resource)


  end

  # GET /resource/sign_out
  def destroy
    set_flash_message :notice, :signed_out if signed_in?(resource_name)
    sign_out_and_redirect(resource_name)
  end
  

  
  protected
=begin
  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.banned?
      sign_out resource
      banned_user_path
    else
     super
    end
  end
=end
end
