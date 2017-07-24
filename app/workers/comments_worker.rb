class CommentsWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'critical'

  def perform()
    
  	NewCommentMailer.new_comment_email().deliver_later
  end

end
