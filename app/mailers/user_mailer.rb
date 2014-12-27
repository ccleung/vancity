class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @url = 'http://ihoshii.com/login'
    mail(to: @user.email, subject: 'Welcome to ihoshii')
  end

  def reply_post_email(replier_email, original_poster_email, title, description)
    @replier_email = replier_email
    @original_poster_email = original_poster_email
    @title = title
    @description = description
    mail(to: @original_poster_email, subject: title)
  end
end
