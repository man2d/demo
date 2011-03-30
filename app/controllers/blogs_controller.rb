#coding: utf-8
class BlogsController < ApplicationController
  def new
    @post = current_user.blog_posts.new
  end
  
  def create
    @post = BlogPost.new(params[:blog_post])
    if @post.save
      flash[:notice] = "Запись добавлена"
      redirect_to blog_path(@post)
    else
      render 'new'
    end
  end
  
  def index
    @posts = BlogPost.paginate(:page => params[:page])
  end
end
