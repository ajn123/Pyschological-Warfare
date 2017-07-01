# TheComments.config.param_name => value

TheComments.configure do |config|
  config.max_reply_depth     = 3                   # comments tree depth
  config.tolerance_time      = 0                  # sec - after this delay user can post a comment
  config.default_state       = :draft              # default state for comment
  config.default_owner_state = :published          # default state for comment for Moderator
  config.empty_inputs        = [:commentBody]      # array of spam trap fields
  config.default_title       = 'Default Title'   # default commentable_title for denormalization
  config.template_engine     = :haml

  config.empty_trap_protection     = true
  config.tolerance_time_protection = false
  config.delete_descendants_on_node_delete = true
end



RenderCommentsTreeHelper::Render.module_eval do 

    # def self.published_comment
    #     "<li>
    #       <div id='comment_#{@comment.anchor}' class='comment #{@comment.state}' data-comment-id='#{@comment.to_param}'>
    #         <div>
    #           #{ avatar }
    #           #{ userbar }
    #           <div class='text'>#{ @comment.content }</div>
    #           #{ reply }
    #         </div>
    #       </div>

    #       <div class='form_holder'></div>
    #       #{ children }
    #     </li>"
    #   end

    #   def self.avatar
    #     "<div class='avatar left float' >
    #       <img src='#{ @comment.avatar_url }' class='left float ' style='height: 40px; width:40px;' alt='userpic' />
    #       #{ controls }
    #     </div>"
    #   end

    #   def self.userbar
    #     anchor = h.link_to('#', '#comment_' + @comment.anchor)
    #     title  = @comment.title.blank? ? t('the_comments.guest_name') : @comment.title
    #     "<div class='author'>#{ title } #{ anchor }</div>"
    #   end
end