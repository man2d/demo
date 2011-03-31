#coding: utf-8
class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def create
    @post = BlogPost.find(params[:blog_id])
    @post.comments.build(:user => current_user, :comment => params[:comment][:comment])
    if @post.save
      flash[:notice] = "Спасибо за Ваш комментарий!"
      redirect_to :back
    else
      flash[:alert] = "Ошибка при сохранении комментария!"
      redirect_to :back
    end
  end
end
