class SelectionController < ApplicationController
  def index
    @page = Page.find_by_slug('filter')
  end
  def list
    
    params[:search].delete("item_assign_id") unless params[:search][:item_assign_id] && params[:search][:item_assign_id].to_i > 0
    params[:search].delete("lgth") unless params[:search][:lgth] && params[:search][:lgth].to_i > 0

    
    @items = Item.brand_new.where(params[:search]).all
    respond_to do |wants|
      wants.js {
        render :update do |page|
          page.replace_html 'filterResult', :partial => 'list'
          page.call 'updateWallpaper'
      	  page.call 'updateFilterResult'
        end
      }
    end
  end
  def search
  end
end
