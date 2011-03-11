class RedirectController < ApplicationController

  def index
    @page = Page.find_by_cached_url("/"+params[:path]+"/")
    @item = Item.find_by_id(params[:path].last)
    if @page
      unless @page.resource
        render 'pages/show'
      else
        render @page.resource
      end
    elsif @item
      render 'catalog/show'
    else  
      render '404'
    end
    
  end
end
