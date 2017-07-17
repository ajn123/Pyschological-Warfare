class UserMailer < ApplicationMailer

	default from: "ajn123@vt.edu"

	 def welcome_email(email)
    mail(to: "aj@psychowarfare.com", subject: "#{email} just signed up")
  end
end
