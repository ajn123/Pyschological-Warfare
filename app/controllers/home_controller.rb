class HomeController < ApplicationController
  def index
    @social = {"twitter": "Tweet", "facebook": "Share", "mail": "E-mail"}
  end



  def create_email

    @new_user = User.new(user_params)

  	respond_to do |f|
  		f.js { render layout: false }
  	end

  end


  private
  	def user_params
  		params.require(:user).permit(:name, :email)
  	end  
end
