class UserMailer < ApplicationMailer

	default from: "ajn123@vt.edu"

	 def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: "aj@psychowarfare.com", subject: "#{@user.email} just signed up")
  end
end
