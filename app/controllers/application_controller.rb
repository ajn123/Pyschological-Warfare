class ApplicationController < ActionController::Base
	include TheComments::ViewToken

  protect_from_forgery with: :exception

	before_action :sharing_meta_tags


	def sharing_meta_tags
	  @path = request.original_url
		@meta_image = nil
	end
end
