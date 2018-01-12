module ApplicationHelper

	def flash_class(level)
	  case level
	  when :success then "ui green message"
	  when :error then "ui red message"
	  when :notice then "ui blue message"
	  end
	end



  class CodeRayify < Redcarpet::Render::HTML
	  def block_code(code, language)
	    CodeRay.scan(code, language).div
	  end
	end

	def markdown(text)
	  coderayified = CodeRayify.new(:filter_html => true,
	                                :hard_wrap => true,
	                                link_attributes: { rel: 'nofollow', target: "_blank" })


	  options2 = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

	  options = {
	    :fenced_code_blocks => true,
	    :no_intra_emphasis => true,
	    :link_attributes => {target: "_blank" },
	    :autolink => true,
	    :lax_html_blocks => true,
	  }
	  markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
	end

	def blog_image_helper(params)
		if params
			"ui floated left medium segment index_image"
		else
			"ui centered large segment article_image rounded image"
		end

	end
end
