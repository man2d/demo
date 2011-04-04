#coding: utf-8
class UsersController < ApplicationController
  before_filter :set_template 
  before_filter :create_avatar, :authenticate_user!, :except => [:show]
    
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Профиль сохранен"
      redirect_to user_path(@user)
    else
      clean_up_passwords(resource)
      render_with_scope :edit
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def sell_yacht
    unless @item
      @item = Item.new
      Property.all.each do |p|
        @item.item_properties.build(:property_id => p.id)
      end
    else
      @item = current_user.item
    end
    @item.gallery_images.build
    

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
