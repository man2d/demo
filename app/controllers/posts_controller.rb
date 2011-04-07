class PostsController < ApplicationController
  before_filter :find_news_page
  def index
    @posts = Post.order("updated_at DESC").paginate(:page => params[:page])
  end
  def show
    @post = Post.find_by_id(params[:id])
#    @items = Item.order("created_at DESC").limit(4)
  end
  
  protected
  def find_news_page
    @page = Page.find_by_slug('news')
  end
end
