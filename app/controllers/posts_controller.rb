class PostsController < ApplicationController
  def index
    @posts = Post.paginate(:page => params[:page])
  end
  def show
    @post = Post.find_by_id(params[:id])
    @items = Item.order("created_at DESC").limit(4)
  end
end
