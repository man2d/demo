#coding: utf-8
class Admin::UsersController < Admin::BaseController
  inherit_resources
  respond_to :html, :xml, :json
  defaults :route_prefix => 'admin', :resource_class => User, :collection_name => 'users', :instance_name => 'user'
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
      NotificationMailer.notification(user, params[:notification]).deliver
    end
    flash[:notice] = "Рассылка инициирована"
    redirect_to :back
  end
  
  protected
  
  def object
    @user = User.find(params[:id])
  end
  def collection
    if params[:search]
      @users = User.where(params[:search]).all
    else
      @users = User.all
    end
  end
end
