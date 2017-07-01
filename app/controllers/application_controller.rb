class ApplicationController < ActionController::Base
	  include TheComments::ViewToken

	  
  protect_from_forgery with: :exception
end
