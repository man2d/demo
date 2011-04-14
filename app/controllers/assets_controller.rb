class AssetsController < ApplicationController
  def destroy
    if current_user
    @asset = Asset.find(params[:id])
    @assetable = @asset.assetable
    if @assetable.user_id == current_user.id
      
      if @asset.destroy
      respond_to do |wants|
        wants.js { 
          render :update do |page|
            page.remove 'asset_'+@asset.id.to_s
          end
        }
        wants.html {
          redirect_to :back
        }
        end
      end
      end
    end
  end
end
