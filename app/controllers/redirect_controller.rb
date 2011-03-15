class RedirectController < ApplicationController

  def index
    @page = Page.find_by_cached_url("/"+params[:path]+"/")
    @item = Item.find_by_id(params[:path].last)
    
    if @page
      @title = @page.title
      unless @page.resource
        render 'pages/show'
      else
        render @page.resource
      end
    elsif @item
      @title = @item.title
      render 'catalog/show'
      #render :nothing => true, :status => 200
    else  
      render '404'
    end
    
  end
end
