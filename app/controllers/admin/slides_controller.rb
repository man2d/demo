class Admin::SlidesController < Admin::BaseController
  inherit_resources
#  nested_belongs_to :item
  respond_to :html, :xml, :json, :js
  defaults :route_prefix => 'admin'
  
  def destroy destroy!{collection_url} end
end
