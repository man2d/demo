class SelectionController < ApplicationController
  def list
    search = {}
    if params[:item_assign_id]
      hash1 = {:item_assign_id => params[:item_assign_id]}
    end
    if params[:lgth]
      hash2 = {:lgth => params[:lgth]}
    end
    @items = Item.where(hash1).where(hash2)
    respond_to do |wants|
      wants.js {
        render :update do |page|
          page.replace_html 'filterResult', :partial => 'list'
        end
      }
    end
  end
  def search
  end
end
