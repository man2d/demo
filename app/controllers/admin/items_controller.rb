class Admin::ItemsController < Admin::BaseController
  inherit_resources
  respond_to :html, :xml, :json
  defaults :route_prefix => 'admin'
 
  def new
    @item = Item.new
    @item.assets.build
    @item.item_properties.build
  end
  
  protected
  
  def collection
    @items = Item.limit(20)
  end
end
