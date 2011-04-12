#coding: utf-8
class AdminMailer < ActionMailer::Base
  default :from => "noreply@yachtclub-neva.ru", :to => "sman2d@gmail.com"
  
  def item_app(item, name, email, message)
    @item = item
    @name = name
    @email = email
    @message = message
    mail(:subject => "Заявка на яхту")
  end
  
  def contact(name, email, message)
    @name = name
    @email = email
    @message = message
    mail(:subject => 'Сообщение с сайта Яхт-клуба "Президент Нева"')
  end
  
  def catalog(user, address = '', message = '', email = '')
    @message = message
    @user = user
    @email = email
    @address = user.address if address == ''
    mail(:subject => "Запрос каталога")
  end
end
