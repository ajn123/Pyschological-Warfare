# frozen_string_literal: true

require 'acts-as-taggable-on'

class Article < ApplicationRecord
  include TheComments::Commentable
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user, optional: true

  acts_as_ordered_taggable_on :tags

  serialize :useful_links, Hash
  serialize :people_mentioned, Hash
  serialize :timestamp, Array

  validates :embedded_link, presence: { message: 'needs a Podcast link' }, uniqueness: true

  scope :published, -> { order('written_at_date DESC, updated_at').where(published: true) }

  scope :index_page, -> { offset(3) }
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

  def add_tag(item)
    tag_list.add(item)
    save
  end

  def published_date
    written_at_date.strftime('%B %d, %Y')
  end

  # Get tags all excluding itself
  def recommended_articles
    Article.published.tagged_with(tag_list, any: true).where.not(id: id.to_s).sample(5)
  end

  def search_content
    ActionView::Base.full_sanitizer.sanitize(content)
  end

  private

  def should_generate_new_friendly_id?
    saved_change_to_attribute?('title') && !title.empty?
  end
end
