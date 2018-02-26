class ArticlesController < ApplicationController


    before_action :default_values

  def index
    @articles = Article.published
    @is_root = true
    respond_to do |format|
      format.html
      format.json { render json: @article }
    end
  end

  def create
  	Article.create(article_params)
  end


  def default_values
    @read_more = false
    @is_root = false
    if self.action_name == "index"
      @read_more = true
    end
  end

  private

  def article_params
  	params.require(:article).permit(:title, :content, :author, :published,
  															    :header_image, :useful_links,
  															    :people_mentioned, :user_id)
  end
end
