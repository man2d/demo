class Admin::PropertiesController < Admin::BaseController
  inherit_resources
  respond_to :html, :xml, :json, :js
  defaults :route_prefix => 'admin'
end
