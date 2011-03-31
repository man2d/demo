#coding: utf-8
class BlogsController < ApplicationController
  def new
    @post = current_user.blog_posts.new
  end
  
  def create
    @post = current_user.blog_posts.build(params[:blog_post])
    if @post.save
      flash[:notice] = "Запись добавлена"
      redirect_to blog_path(@post)
    else
      render 'new'
    end
  end
  
  def admin_posts
    @posts = BlogPost.joins(:user).where("users.user_type = 'admin'").paginate(:page => params[:page])
    render 'index'
  end
  
  def member_posts
    @posts = BlogPost.joins(:user).where("users.user_type = 'owner' OR users.user_type = 'captain'").paginate(:page => params[:page])
    render 'index'
  end
  
  def tags
    @posts = BlogPost.find_tagged_with(params[:tag])
    render 'index'
  end
  
  def topics
    @post = BlogPost.joins(:blog_topic).where("blog_topics.title = ?", params[:topic_id])
    render 'index'
  end
  
  def index
    @posts = BlogPost.paginate(:page => params[:page])
  end
  
  def show
    @post = BlogPost.find(params[:id])
  end
end
