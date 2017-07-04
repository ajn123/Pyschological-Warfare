require "acts-as-taggable-on"

class Article < ApplicationRecord
	include TheComments::Commentable

	belongs_to :user

  acts_as_ordered_taggable_on :tags

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

  def add_tag item 
     self.tag_list.add(item)
     self.save
  end
  
  # Get tags all excluding itself
  def recommended_articles
    Article.tagged_with(self.tag_list).where.not(id: "#{self.id}").sample(5)
  end


end
