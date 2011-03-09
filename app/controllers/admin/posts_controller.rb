class Admin::PostsController < Admin::BaseController
  inherit_resources
  respond_to :html, :xml, :json
  defaults :route_prefix => 'admin'
  custom_actions :resource => :menu
  def create
    redirect_to collection_url
  end
  
  def menu
    render :partial => 'admin/shared/menu'
  end
end
