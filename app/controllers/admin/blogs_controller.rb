class Admin::BlogsController < Admin::BaseController
  inherit_resources
  respond_to :html, :xml, :json
  defaults :route_prefix => 'admin', :resource_class => BlogPost, :collection_name => 'blog_posts', :instance_name => 'blog_post'
  custom_actions :resource => :menu
  def create
    create!(:notice => "Dude! Nice job creating that page. Yeeeah") { collection_url }
  end
  def update
    update!(:notice => "Dude! Nice job creating that page. Yeeeah") { collection_url }
  end
  
  def menu
    render :partial => 'admin/shared/menu'
  end
end
