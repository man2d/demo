#coding: utf-8
class NotificationMailer < ActionMailer::Base
  default :from => "noreply@yachtclub-neva.ru"
  
  def notification(user, message)
    @user = user
    @notification = message
    @url  = "http://example.com/login"
    mail(:to => user.email,
             :subject => 'Рассылка с сайта яхт-клуба "Президент Нева"') 
  end
end
