class NewCommentMailer < ApplicationMailer
	default from: "aj@psychowarfare.com"

	 def new_comment_email()
	 	@email = email
    mail(to: "aj@psychowarfare.com", subject: "new comment")
  end
end
