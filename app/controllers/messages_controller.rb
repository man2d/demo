#coding: utf-8
class MessagesController < ApplicationController
  def contact #контактная форма
    AdminMailer.contact(params[:name], params[:email], params[:message]).deliver
    flash[:notice] = "Сообщение отправлено"
    redirect_to :back
  end
  
  def item_app #чувак богатый сильно, надо бы адрес узнать. редирект на страницу с заказом каталога?
    AdminMailer.item_app(params[:name], params[:email], params[:message]).deliver
    flash[:notice] = "Сообщение отправлено"
    redirect_to :back    
  end
  
  def catalog #чувак заказал каталог
    AdminMailer.catalog(user, params[:address], params[:message]).deliver
    flash[:notice] = "Сообщение отправлено"
    redirect_to :back
  end
  
  def captain #пригласить капитана
    @user = User.find(params[:id])
    @sender = current_user
    UserMailer.captain(@user).deliver
    flash[:notice] = "Сообщение отправлено"
    redirect_to :back
    
  end
  
  def message #сообщение чуваку
    @sender = current_user
    @user = User.find(params[:id])
    UserMailer.message(@user, @sender, params[:message]).deliver
    flash[:notice] = "Сообщение отправлено"
    redirect_to :back
  end
  
  def form
  end
  
  protected
  def redirect_to_back
    redirect_to :back
  end
end
