#coding: utf-8
class BlogsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update]
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
  
  def edit
    @post = current_user.blog_posts.find(params[:id])
  end
  
  def update
    @post = current_user.blog_posts.find(params[:id])
    if @post.update_attributes(params[:blog_post])
      flash[:notice] = "Запись сохранена"
      redirect_to blog_path(@post)
    else
      render 'edit'
    end
  end
  
  def destroy
    @post = current_user.blog_posts.find(params[:id])
    if @post.destroy
      redirect_to :back
    else
      flash[:notice] = "Не удалось удалить сообщение"
      redirect_to :back
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
    @posts = BlogPost.tagged_with(CGI.unescape(params[:tag])).paginate(:page => params[:page])
    render 'index'
  end
  
  def topics
    @posts = BlogPost.where(:blog_topic_id => params[:topic_id]).paginate(:page => params[:page])
    render 'index'
  end
  
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @posts = @user.blog_posts.paginate(:page => params[:page])
    else
      @posts = BlogPost.paginate(:page => params[:page])
    end
  end
  
  def show
    @post = BlogPost.find(params[:id])
  end
end
