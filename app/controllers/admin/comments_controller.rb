class Admin::CommentsController < Admin::BaseController
  inherit_resources
  respond_to :html, :xml, :json
  defaults :route_prefix => 'admin'
  custom_actions :resource => :menu
  def create
    create!(:notice => "Dude! Nice job creating that page. Yeeeah") { collection_url }
  end
  def update
    update!(:notice => "Dude! Nice job creating that page. Yeeeah") { collection_url }
  end
  
  def menu
    render :partial => 'admin/shared/menu'
  end
  
  def collection
    if params[:search]
      Comment.where(params[:search]).all
    else
      Comment.all
    end
  end
end
