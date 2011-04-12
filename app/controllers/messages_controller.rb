#coding: utf-8
class MessagesController < ApplicationController
  def contact #контактная форма
    AdminMailer.contact(params[:name], params[:email], params[:message]).deliver
    flash[:notice] = "Сообщение отправлено"
    redirect_to :back
  end
  
  def item_app #чувак богатый сильно, надо бы адрес узнать. редирект на страницу с заказом каталога?
    @item = Item.find(params[:id])
    AdminMailer.item_app(@item, params[:name], params[:email], params[:message]).deliver
    flash[:notice] = "Сообщение отправлено"
    redirect_to :back    
  end
  
  def catalog #чувак заказал каталог
    @user = User.find(params[:id])
    AdminMailer.catalog(@user, params[:address], params[:message], params[:email]).deliver
    flash[:notice] = "Сообщение отправлено"
    redirect_to :back
  end
  
  def captain #пригласить капитана
    @user = User.find(params[:id])
    @sender = current_user
    UserMailer.captain(@user, @sender).deliver
    flash[:notice] = "Сообщение отправлено"
    redirect_to :back
    
  end
  
  def message #сообщение чуваку
    @sender = current_user
    @user = User.find(params[:id])
    UserMailer.user_message(@user, @sender, params[:message]).deliver
    flash[:notice] = "Сообщение отправлено"
    redirect_to :back
  end
  
  def form
  end
  
  def catalog_form
    @user = User.find(params[:id])
    
  end
  
  protected
  def redirect_to_back
    redirect_to :back
  end
end
