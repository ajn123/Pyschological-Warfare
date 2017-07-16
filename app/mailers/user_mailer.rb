class UserMailer < ApplicationMailer

	default from: "ajn123@vt.edu"

	 def welcome_email(user)
    @user = user
    mail(to: "aj@psychowarfare.com", subject: "#{@user.email} just signed up")
  end
end
