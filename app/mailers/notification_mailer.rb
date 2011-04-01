class NotificationMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def notification(user, message)
    @user = user
    @notification = message
    @url  = "http://example.com/login"
    mail(:to => user.email,
             :subject => "Welcome to My Awesome Site") 
  end
end
