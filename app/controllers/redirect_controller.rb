class RedirectController < ApplicationController

  def index
    @page = Page.find_by_cached_url("/"+params[:path]+"/")
#    @page = Page.find(params[:id]) if !@page
    if @page
      @title = @page.title
      unless @page.resource
        render 'pages/show'
      else
        render @page.resource
      end
    else
      @item = Item.find_by_id(params[:path].split("/").last)
      if @item
        @title = @item.title
        unless @item.page.slug == 's_probegom'
          render 'catalog/show'
        else
          render 'catalog/show_used'
        end
       #render :nothing => true, :status => 200
      else  
        render '404'
      end
    end
    
  end
end
