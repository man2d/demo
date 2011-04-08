#coding: utf-8
class UserMailer < ActionMailer::Base
  default :from => "noreply@yachtclub-neva.ru"
  
  def captain(user, sender)
    @user = user
    @sender = sender
    mail(:to => user.email, :subject => "Пользователь #{@sender.name} приглашает Вас")
  end
  
  def message(user, sender, message)
    @user = user
    @message = message
    @sender = sender
#    @url  = "http://example.com/login"
    mail(:to => user.email,
             :subject => 'Сообщение от пользователя с сайта Яхт-клуба "Президент Нева"')
  end
end
