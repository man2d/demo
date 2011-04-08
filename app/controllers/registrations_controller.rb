class RegistrationsController < ApplicationController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
  prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]
  include Devise::Controllers::InternalHelpers
  before_filter :set_template,:create_avatar
  # GET /resource/sign_up
  def new
    @template = 0
    build_resource({})
    render_with_scope :new
  end

  # POST /resource
  def create
    build_resource

    if resource.save
      if resource.address != ''
        AdminMailer.catalog(resource).deliver
      end
      set_flash_message :notice, :signed_up
      sign_in_and_redirect(resource_name, resource)
    else
      clean_up_passwords(resource)
      render_with_scope :new
    end
  end

  # GET /resource/edit
  def edit
    @user = current_user
    
    render_with_scope :edit
  end

  # PUT /resource
  def update
    if resource.update_attributes(params[resource_name])
      set_flash_message :notice, :updated
      redirect_to after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      render_with_scope :edit
    end
  end

  # DELETE /resource
  def destroy
    resource.destroy
    set_flash_message :notice, :destroyed
    sign_out_and_redirect(self.resource)
  end

  protected

    # Authenticates the current scope and gets a copy of the current resource.
    # We need to use a copy because we don't want actions like update changing
    # the current user in place.
    def authenticate_scope!
      send(:"authenticate_#{resource_name}!")
      self.resource = resource_class.find(send(:"current_#{resource_name}").id)
    end
    
    def set_template
      @template = 2
    end
    def create_avatar
      current_user.build_avatar if current_user && !current_user.avatar
      current_user.build_item if current_user && !current_user.item
    end
end
