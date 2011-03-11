class ItemsController < ApplicationController
  layout nil
  def show
    @item = Item.find(params[:id])
  end
end
