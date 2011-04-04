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
  end
  
  def show
    @item = Item.find(params[:id])
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
