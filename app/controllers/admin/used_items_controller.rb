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
    @item = Item.find_by_id(params[:id])
  end
  def collection
    if params[:page_id]
      @items = Item.find_all_by_page_id(params[:page_id])
    else
      @items = Item.used.all
    end
  end
end
