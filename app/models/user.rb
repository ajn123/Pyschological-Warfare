# frozen_string_literal: true

class User < ApplicationRecord
  include TheComments::User

  validates :name, :email, presence: true
  validates_format_of :email, with: /@/
  validates_uniqueness_of :email

  has_many :articles

  # Your way to define privileged users
  def admin?
    true
  end

  # Required TheComments methods for users restrictions
  def comments_admin?
    true
  end

  def comments_moderator?(comment)
    id == comment.holder_id
  end
end
