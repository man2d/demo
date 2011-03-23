class CatalogController < ApplicationController
  def index
    @page = Page.find_by_id(params[:id]) unless @page
    @items = Item.paginate(:page => params[:page]).order(:position)
  end
  
  def show

  end
  
  def used
    @page = Page.find_by_slug('s_probegom')
    @items = @page.items.order(params[:sort]).order(:position)
  end
  
  def main
    @page = Page.find_by_slug('catalog')
    @used_page = Page.find_by_slug('s_probegom')
    @brands = Page.find_by_slug('catalog').children.where("slug != 's_probegom'")
    @items = @used_page.items.order(:position)
  end
end
