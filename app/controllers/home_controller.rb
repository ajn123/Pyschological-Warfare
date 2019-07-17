# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :default_values

  def index
    @social = { "twitter": 'Tweet', "facebook": 'Share', "mail": 'E-mail' }
    @mast_head = Article.published.friendly.first(3)
    @is_root = true
  end

  def show
    @article = Article.published.friendly.find(params[:id])
    @comments = @article.comments.with_state(%i[draft published])
  end

  def search
    @tag = params[:tag]
    @articles = Article.tagged_with(@tag)
  end

  def listen
    @show_masthead = false
  end

  def default_values
    @read_more = false
    @is_root = false
    @read_more = true if action_name == 'index'
  end
end
