class ArticleController < ApplicationController
  def create
  	Article.create(article_params)
  end

  def index
  end


  private

  def article_params
  	params.require(:article).permit(:title, :content, :author, :published, 
  															    :header_image, :useful_links, 
  															    :people_mentioned, :user_id)
  end
end
