class Admin::AssetsController < Admin::BaseController
  inherit_resources
  nested_belongs_to :item
  respond_to :html, :xml, :json
  defaults :route_prefix => 'admin'
end
