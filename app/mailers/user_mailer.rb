# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'aj@psychowarfare.com'

  def welcome_email(email)
    @email = email
    mail(to: 'aj@psychowarfare.com', subject: "#{email} just signed up")
   end
end
