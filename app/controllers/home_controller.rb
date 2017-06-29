class HomeController < ApplicationController
  def index
    @social = {"twitter": "Tweet", "facebook": "Share", "mail": "E-mail"}
  end



  def create_email

    @new_email = Email.new(email_params)

  	respond_to do |f|
  		f.js {render layout: false}
  	end

  	head :ok
  end



  private
  	def email_params
  		params.require(:email).permit(:email)
  	end

  
end
