class Admin::UsedItemsController < Admin::BaseController
  inherit_resources
  respond_to :html, :xml, :json
  defaults :route_prefix => 'admin'
 
  def new
    @item = Item.new
#    @item.assets.build
    @item.item_properties.build
  end
  
  def create
    create!(:notice => "Dude! Nice job creating that page. Yeeeah") { collection_url }
  end
  
  def update
    update!(:notice => "Dude! Nice job creating that page. Yeeeah") { collection_url }
  end
  
  def menu
    render :partial => 'menu'
  end
  
  protected
  
  def resource
    @item = Item.unscoped.find(params[:id])
  end
  def collection
    if params[:page_id]
        @items = Item.unscoped.where(:page_id => params[:page_id]).all
      else
        @items = Item.unscoped.where("page_id = 10").all
    end
  end
end
