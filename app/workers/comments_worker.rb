# frozen_string_literal: true

class CommentsWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'critical'

  def perform(args)
    NewCommentMailer.new_comment_email(args).deliver_later
  end
end
