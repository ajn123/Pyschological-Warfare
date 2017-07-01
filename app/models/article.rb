class Article < ApplicationRecord
	include TheComments::Commentable

	belongs_to :user

  # Denormalization methods
  # Check the documentation for information on advanced usage
    def commentable_title
    title
  end

  def commentable_url
    ['', self.class.to_s.tableize, id].join('/')
  end

  def commentable_state
    :published.to_s
  end
end
