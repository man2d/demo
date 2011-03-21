class HomeController < ApplicationController
  in_place_edit_for :post, :title
  in_place_edit_for :item, :description
  in_place_edit_for :item, :announce
  in_place_edit_for :block, :content
  def set_post_title
        post = Post.find(params[:id]) 
        post.title = params[:value] # Name of parameter is always 'value'.
        post.save

        # It should render a text 
        render :text => post.title
      end
  
  def index
    @items = Item.order("created_at DESC").limit(16)
    @blog_posts = @posts = Post.order("created_at DESC").limit(5)
    
    @page = Page.find_by_slug("main")
    @blocks = @page.blocks.limit(1) if @page
  end
  
  def show
    @page = Page.find_by_slug(params[:id])
    @page = Page.find(params[:id]) unless @page
  end
end
