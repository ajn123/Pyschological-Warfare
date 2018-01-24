class ApplicationController < ActionController::Base
	include TheComments::ViewToken

  protect_from_forgery with: :exception

	before_action :sharing_meta_tags


	def sharing_meta_tags
	  @path = request.original_url
		@meta_image = nil
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


	def user_params
		params.require(:user).permit(:name, :email)
	end

end
