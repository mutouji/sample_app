class UserMailer < ActionMailer::Base
  default from: "mutouji1@163.com"

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/login'
    mail(to:@user.email, subject: 'Welcome to My Awesome Site')
  end
end