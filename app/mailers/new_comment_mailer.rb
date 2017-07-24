class NewCommentMailer < ApplicationMailer
	default from: "aj@psychowarfare.com"

	 def new_comment_email(args)
	 	@name = args[0]
	 	@contacts = args[1]
	 	@content = args[2]
	 	@commentable_title = args[3]

    mail(to: "aj@psychowarfare.com", subject: "#{@name} posted new comment")
  end
end
