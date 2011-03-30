class Admin::UsersController < Admin::BaseController
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
  
  def notification
    
  end
  
  def send_notification
    @users = User.find(params[:users])
    @users.each do |user|
      NotificationMailer.deliver_notification(user)
    end
  end
  
  protected
  
  def object
    @user = User.find(params[:id])
  end
  def collection
    @users = User.all
  end
end
