module HomeHelper


	def read_more?(article,read_more)
		 if read_more == false 
         article.content.html_safe 
     else 
         truncate(ActionView::Base.full_sanitizer.sanitize(article.content.html_safe), length: 300) 
     end 
	end
end
