class CatalogController < ApplicationController
  def index
    @page = Page.find_by_id(params[:id]) unless @page
    @items = Item.paginate(:page => params[:page])
  end
  
  def show
    @item = Item.find_by_id(params[:id])
  end
  
  def used
    @page = Page.find_by_slug('s_probegom')
    @items = @page.items.order(params[:sort])
  end
  
  def main
    @page = Page.find_by_slug('s_probegom')
    @brands = Page.find_by_slug('catalog').children.where("slug != 's_probegom'")
    @items = @page.items
  end
end
