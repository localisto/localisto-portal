class Systemmailer < ActionMailer::Base
 default :from => "hello@localisto.org"
 
  def newportal_user_notification(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:to => 'hello@localisto.org', :subject => "New Portal User")
  end

   def to_newportal_user(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:to => 'hello@localisto.org', :subject => "Welcome to the Localisto Portal")
  end


end
