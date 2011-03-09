class CatalogController < ApplicationController
  def index
    @items = Item.paginate(:page => params[:page])
  end
  
  def show
    @item = Item.find_by_id(params[:id])
  end
end
