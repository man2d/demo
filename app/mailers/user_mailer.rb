class UserMailer < ActionMailer::Base
  default :from => "noreply@yachtclub-neva.ru"
  
  def captain(user, sender)
    @user = user
    @sender = sender
    mail(:to => user.email, "Пользователь #{@sender.name} ")
  end
  
  def message(user, sender, message)
    @user = user
    @message = message
    @sender = sender
#    @url  = "http://example.com/login"
    mail(:to => user.email,
             :subject => "Welcome to My Awesome Site")
  end
end
