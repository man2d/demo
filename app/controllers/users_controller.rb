#coding: utf-8
class UsersController < ApplicationController
  before_filter :set_template 
  before_filter :create_avatar, :authenticate_user!, :except => [:show]
    
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Профиль сохранен"
      redirect_to after_update_path_for(@user)
    else
      clean_up_passwords(resource)
      render_with_scope :edit
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def sell_yacht
  end
  
  def pagestyle
  end
  
  def personal
  end

  protected
  def set_template
    @template = 2
  end  
  def create_avatar
    current_user.build_avatar if current_user && !current_user.avatar
    current_user.build_item if current_user && !current_user.item
  end
end
