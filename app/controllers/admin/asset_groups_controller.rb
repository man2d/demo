class Admin::AssetGroupsController < Admin::BaseController
  inherit_resources
  respond_to :html, :xml, :json, :js
  defaults :route_prefix => 'admin'
  
=begin
  def new
    new! do |format|
      format.js
    end
  end
=end
end
