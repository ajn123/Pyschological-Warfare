class HomeController < ApplicationController

  before_action :default_values

  def index
    @social = {"twitter": "Tweet", "facebook": "Share", "mail": "E-mail"}
    @mast_head = Article.first(3)
    @articles = Article.offset(3).paginate(:page => params[:page], per_page: 5)
    @is_root = true
  end

  def show
    @article = Article.friendly.find(params[:id])
    @comments = @article.comments.with_state([:draft, :published])
  end

  def create_email
    @new_user = User.new(user_params)

    if @new_user.valid?
       HardWorker.perform_async([@new_user.name, @new_user.email])
    end
  	respond_to do |f|
  		f.js { render layout: false }
  	end
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
    if self.action_name == "index"
      @read_more = true
    end
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email)
  	end
end
