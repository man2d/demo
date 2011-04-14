#coding: utf-8
class NotificationMailer < ActionMailer::Base
  default :from => "noreply@yachtclub-neva.ru"
  
  def notification(user, message, attachment)
    @user = user
    @notification = message
    @url  = "http://example.com/login"
#    logger.info attachment.methods
    attachments[attachment.original_filename] = File.read(attachment.tempfile)
    mail(:to => user.email,
             :subject => 'Рассылка с сайта яхт-клуба "Президент Нева"') 
  end
end
