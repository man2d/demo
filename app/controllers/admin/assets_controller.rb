class Admin::AssetsController < Admin::BaseController
  inherit_resources
#  nested_belongs_to :item
  respond_to :html, :xml, :json, :js
  defaults :route_prefix => 'admin'
  
  def destroy

    destroy!{
    super do |format|
      format.js {
        
      }
    end
    }
  end
end
