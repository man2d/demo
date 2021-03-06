class Admin::ItemsController < Admin::BaseController
  inherit_resources
  respond_to :html, :xml, :json
  defaults :route_prefix => 'admin'
 
  def new
    @item = Item.new
    @item.build_image
    @item.build_video
    new!
  end
  
  def edit
    @item = Item.unscoped.find(params[:id])
    @item.build_video unless @item.video
    @item.build_image unless @item.image
    edit!
  end
  
  def create
    create!(:notice => "Dude! Nice job creating that page. Yeeeah") { collection_url }
  end
  
  def update
    @item = Item.unscoped.find(params[:id])
    update!(:notice => "Dude! Nice job creating that page. Yeeeah") { collection_url }
  end
  
  def menu
    render :partial => 'menu'
  end
    
  
  protected

  
  def collection
    if params[:page_id]
      @items = Item.unscoped.where(:page_id => params[:page_id]).order(:position).all
    else
      @items = Item.unscoped.where("page_id != 10").order(:position).all
    end
  end


end