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
  
  def notifications
    @notifications = Notification.all
  end
  
  def send_notification
    @users = User.find(params[:user_id])
    @notification = Notification.new(:notification => params[:notification])
    @user_ids = []
    @users.each do |user|
      NotificationMailer.notification(user, params[:notification], params[:attachment]).deliver
      @user_ids << user.id
    end
    @notification.user_ids = @user_ids
    @notification.save
    flash[:notice] = "Рассылка инициирована"
    redirect_to :back
  end
  
  protected
  
  def object
    @user = User.find(params[:id])
  end
  def collection
    if params[:search]
      if params[:search][:activated] && params[:search][:activated].to_i == 0
        @users = User.where(:activated => nil).all
      else
        @users = User.where(params[:search]).all
      end
    else
      @users = User.all
    end
  end
end
