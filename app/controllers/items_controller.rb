#coding: utf-8
class ItemsController < ApplicationController
#  layout nil, :only => :show
  
  def new
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
  
  def edit
    @item = current_user.item
    Property.all.each do |p|
      @item.item_properties.build(:property_id => p.id) unless @item.item_properties.where(:property_id => p.id).first
    end
  end
  
  def show
    @item = User.find(params[:user_id]).item
  end
  
  def create
    @item = current_user.build_item(params[:item])
    if @item.save
      flash[:notice] = "Яхта сохранена"
      redirect_to user_path(current_user)
    else
      render 'items/new'
    end
  end
  
  def update
    @item = current_user.item
    if @item.update_attributes(params[:item])
      flash[:notice] = "Яхта сохранена"
      redirect_to user_path(current_user)
    else
      render 'items/edit'
    end
  end
end
